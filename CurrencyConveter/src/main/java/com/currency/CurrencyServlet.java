package com.currency;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

public class CurrencyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) {

        try {

            String amountStr = req.getParameter("amount");
            String from = req.getParameter("from");
            String to = req.getParameter("to");

            double amount = Double.parseDouble(amountStr);

            double rate = 0;

            /* TRY DATABASE FIRST */
            try {

                Connection db = DBConnection.getConnection();

                PreparedStatement ps = db.prepareStatement(
                "SELECT * FROM currency_rates ORDER BY rate_date DESC LIMIT 1"
                );

                ResultSet rs = ps.executeQuery();

                if(rs.next()){

                    double fromRate = rs.getDouble(from);
                    double toRate = rs.getDouble(to);

                    rate = toRate / fromRate;
                }

                db.close();

            } catch(Exception e){
                rate = 0;
            }

            /* FALLBACK TO API */
            if(rate == 0){

                String api =
                "https://api.frankfurter.app/latest?from=" + from + "&to=" + to;

                HttpURLConnection con =
                        (HttpURLConnection)new URL(api).openConnection();

                con.setRequestMethod("GET");

                BufferedReader br =
                        new BufferedReader(new InputStreamReader(con.getInputStream()));

                StringBuilder json = new StringBuilder();
                String line;

                while((line = br.readLine()) != null){
                    json.append(line);
                }

                JSONObject obj = new JSONObject(json.toString());

                rate = obj.getJSONObject("rates").getDouble(to);
            }

            double result = amount * rate;

            req.setAttribute("amount", amountStr);
            req.setAttribute("from", from);
            req.setAttribute("to", to);
            req.setAttribute("result", result);

            req.getRequestDispatcher("/index.jsp").forward(req,res);

        } catch(Exception e){

            e.printStackTrace();

            try{
                req.setAttribute("result","Conversion error");
                req.getRequestDispatcher("/index.jsp").forward(req,res);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
    }
}
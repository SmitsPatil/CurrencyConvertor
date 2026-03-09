package com.currency;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.json.JSONObject;

public class AutoRateUpdater extends HttpServlet {

    public void init() throws ServletException {

        System.out.println("AutoRateUpdater started...");

        try {

            Connection db = DBConnection.getConnection();

            PreparedStatement ps = db.prepareStatement(
            "SELECT MAX(rate_date) FROM currency_rates"
            );

            ResultSet rs = ps.executeQuery();
            rs.next();

            String startDate;

            if(rs.getDate(1) == null){
                startDate = "2026-01-01";
            }
            else{
                startDate = rs.getDate(1)
                        .toLocalDate()
                        .plusDays(1)
                        .toString();
            }

            String today = java.time.LocalDate.now().toString();

            if(startDate.compareTo(today) > 0){
                db.close();
                return;
            }

            String api =
            "https://api.frankfurter.app/" + startDate + ".." + today + "?from=USD";

            HttpURLConnection con =
                    (HttpURLConnection) new URL(api).openConnection();

            con.setRequestMethod("GET");

            BufferedReader br =
                    new BufferedReader(new InputStreamReader(con.getInputStream()));

            StringBuilder json = new StringBuilder();
            String line;

            while((line = br.readLine()) != null){
                json.append(line);
            }

            JSONObject obj = new JSONObject(json.toString());
            JSONObject rates = obj.getJSONObject("rates");

            for(String date : rates.keySet()){

                JSONObject c = rates.getJSONObject(date);

                PreparedStatement insert = db.prepareStatement(
                "INSERT IGNORE INTO currency_rates (base_currency,rate_date,USD,EUR,INR,GBP,AUD,CAD,JPY,CNY,CHF) VALUES (?,?,?,?,?,?,?,?,?,?,?)"
                );

                insert.setString(1,"USD");
                insert.setString(2,date);
                insert.setDouble(3,1);
                insert.setDouble(4,c.optDouble("EUR",0));
                insert.setDouble(5,c.optDouble("INR",0));
                insert.setDouble(6,c.optDouble("GBP",0));
                insert.setDouble(7,c.optDouble("AUD",0));
                insert.setDouble(8,c.optDouble("CAD",0));
                insert.setDouble(9,c.optDouble("JPY",0));
                insert.setDouble(10,c.optDouble("CNY",0));
                insert.setDouble(11,c.optDouble("CHF",0));

                insert.executeUpdate();
            }

            db.close();

            System.out.println("Exchange rates updated.");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
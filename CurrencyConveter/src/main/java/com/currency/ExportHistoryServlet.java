package com.currency;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ExportHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) {

        res.setContentType("text/csv");
        res.setHeader("Content-Disposition","attachment; filename=currency_rates.csv");

        try {

            PrintWriter out = res.getWriter();
            Connection db = DBConnection.getConnection();

            // CSV Header
            out.println("Base,Date,USD,EUR,INR,GBP,AUD,CAD,JPY,CNY,CHF");

            PreparedStatement ps = db.prepareStatement(
            "SELECT base_currency, rate_date, USD, EUR, INR, GBP, AUD, CAD, JPY, CNY, CHF FROM currency_rates ORDER BY rate_date DESC"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                out.println(
                    rs.getString("base_currency") + "," +
                    rs.getDate("rate_date") + "," +
                    rs.getDouble("USD") + "," +
                    rs.getDouble("EUR") + "," +
                    rs.getDouble("INR") + "," +
                    rs.getDouble("GBP") + "," +
                    rs.getDouble("AUD") + "," +
                    rs.getDouble("CAD") + "," +
                    rs.getDouble("JPY") + "," +
                    rs.getDouble("CNY") + "," +
                    rs.getDouble("CHF")
                );
            }

            rs.close();
            ps.close();
            db.close();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
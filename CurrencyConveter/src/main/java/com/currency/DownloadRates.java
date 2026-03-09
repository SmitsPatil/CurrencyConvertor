package com.currency;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;

import org.json.JSONObject;

public class DownloadRates {

    public static void main(String[] args) {

        try {

        	String api =
        			"https://api.frankfurter.app/2026-01-01..2026-12-31?from=USD";

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

            System.out.println(json.toString()); // optional debug

            JSONObject obj = new JSONObject(json.toString());
            JSONObject rates = obj.getJSONObject("rates");

            Connection db = DBConnection.getConnection();

            for(String date : rates.keySet()){

                JSONObject c = rates.getJSONObject(date);

                double usd = 1;
                double eur = c.optDouble("EUR",0);
                double inr = c.optDouble("INR",0);
                double gbp = c.optDouble("GBP",0);
                double aud = c.optDouble("AUD",0);
                double cad = c.optDouble("CAD",0);
                double jpy = c.optDouble("JPY",0);
                double cny = c.optDouble("CNY",0);
                double chf = c.optDouble("CHF",0);

                PreparedStatement ps = db.prepareStatement(
                "INSERT INTO currency_rates (base_currency,rate_date,USD,EUR,INR,GBP,AUD,CAD,JPY,CNY,CHF) VALUES (?,?,?,?,?,?,?,?,?,?,?)"
                );

                ps.setString(1,"USD");
                ps.setString(2,date);
                ps.setDouble(3,usd);
                ps.setDouble(4,eur);
                ps.setDouble(5,inr);
                ps.setDouble(6,gbp);
                ps.setDouble(7,aud);
                ps.setDouble(8,cad);
                ps.setDouble(9,jpy);
                ps.setDouble(10,cny);
                ps.setDouble(11,chf);

                ps.executeUpdate();
            }

            db.close();

            System.out.println("Exchange rates downloaded and stored successfully.");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
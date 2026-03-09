package com.currency;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class test {

    public static void main(String[] args) {

        try {

            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO exchange_rates (rate_date, base_currency, target_currency, rate) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "2025-01-01");
            ps.setString(2, "USD");
            ps.setString(3, "INR");
            ps.setDouble(4, 83.25);

            ps.executeUpdate();

            System.out.println("Insert successful");

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
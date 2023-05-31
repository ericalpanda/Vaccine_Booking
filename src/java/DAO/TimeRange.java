/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author DELL VOSTRO 5510
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.timeRange;

public class TimeRange {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<timeRange> getTimeRange() {
        List<timeRange> list = new ArrayList<>();
        String query = "select * from time_range";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new timeRange(rs.getInt(1), rs.getTime(2), rs.getTime(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        TimeRange dao = new TimeRange();
        List<timeRange> list = dao.getTimeRange();
        for (timeRange o : list) {
            System.out.println(o);
        }
    }
}

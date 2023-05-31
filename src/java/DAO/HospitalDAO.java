/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Hospital;

/**
 *
 * @author DELL VOSTRO 5510
 */
public class HospitalDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Hospital> getAllHospital() {
        List<Hospital> list = new ArrayList<>();
        String query = "select * from hospital";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Hospital(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertHospital(String name, String address, String email, String hotline, String username, String password) {
        String query = "INSERT INTO hospital "
                + "(name, address, email, hotline, username, password)\n"
                + "VALUES (?,?,?,?,?,?);";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, email);
            ps.setString(4, hotline);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateHospital(int id, String name, String address, String email, String hotline, String username, String password) {
        String query = "UPDATE hospital "
                + "SET name = ?, address = ?, email = ?, "
                + "hotline = ?, username = ?, password = ? "
                + "WHERE idBV = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, email);
            ps.setString(4, hotline);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteHospital(String dhid) {
        String query = "DELETE FROM hospital WHERE idBV = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, dhid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        HospitalDAO dao = new HospitalDAO();

//        dao.insertHospital("Hospital 2", "123 Street, City", "hospital2@example.com", "123456789", "user2", "pass2");
//        dao.insertHospital("Hospital 4", "456 Street, City", "hospital4@example.com", "987654321", "user4", "pass4");
        
//        int hospitalIdToUpdate = 37;  
//        dao.updateHospital(hospitalIdToUpdate, "Hospital 66", "66 Address", "66hemail@example.com", "987654321", "username66", "password66");

//        String dhid = "36";
//        dao.deleteHospital(dhid);

        List<Hospital> listH = dao.getAllHospital();
        for (Hospital o : listH) {
            System.out.println(o);
        }

    }
}

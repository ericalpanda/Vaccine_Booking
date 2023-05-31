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
import model.Vaccine;
import model.VaccineProvision;

/**
 *
 * @author DELL VOSTRO 5510
 */
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Vaccine> getAllVaccine() {
        List<Vaccine> list = new ArrayList<>();
        String query = "select * from vaccine";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Vaccine(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<VaccineProvision> getAllVaccine_provision() {
        List<VaccineProvision> list = new ArrayList<>();
        String query = "select * from vaccine_provision";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new VaccineProvision(rs.getDouble(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalVaccine() {
        String query = "select count(*) from vaccine";
        try {
            conn = new DBContext().getConnection();             //Mo ket noi voi SQL sever
            ps = conn.prepareStatement(query);                  //Chuyen cau lenh o Query vao
            rs = ps.executeQuery();                             //Chay cau lenh Query
            //Lay du lieu o "rs" dua vao "list"
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void insertVaccine(String name, String detail) {
        String query = "INSERT INTO vaccine (name, detail)\n"
                + "VALUES (?,?);";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, detail);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateVaccine(int idVaccine, String name, String detail) {
        String query = "UPDATE vaccine "
                + "SET name = ?, detail = ? "
                + "WHERE idVaccine = ?";
        try {
            conn = new DBContext().getConnection(); // mở kết nối với SQL server
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, detail);
            ps.setInt(3, idVaccine);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteVaccine(String dvid) {
        String query = "DELETE FROM vaccine WHERE idVaccine = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, dvid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Vaccine> searchByName(String txtSearch) {
        List<Vaccine> list = new ArrayList<>();
        String query = "select * from vaccine\n"
                + "where [name] like ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Vaccine(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Vaccine> getPage(int numPage) {
        List<Vaccine> list = new ArrayList<>();
        String query = "select * from vaccine order by idVaccine offset ? ROWS FETCH next 5 ROWS only;";
        try {
            conn = new DBContext().getConnection();             //Mo ket noi voi SQL sever
            ps = conn.prepareStatement(query);                  //Chuyen cau lenh o Query vao
            ps.setInt(1, (numPage - 1) * 5);
            rs = ps.executeQuery();                             //Chay cau lenh Query
            while (rs.next()) {
                list.add(new Vaccine(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

//        dao.insertVaccine("Vaccine 19", "19 Detail");
//        String dvid = "10";
//        dao.deleteVaccine(dvid);
//
//        List<Vaccine> searchResult = dao.searchByName("n-Covy");
//        for (Vaccine vaccine : searchResult) {
//            System.out.println(vaccine.toString());
//        }
//        dao.updateVaccine(11, "n-Covy", "vaccine C");
//
//        List<Vaccine> page = dao.getPage(2);
//        for (Vaccine o : page) {
//            System.out.println(o);
//        }
        List<Vaccine> list = dao.getAllVaccine();
        for (Vaccine l : list) {
            System.out.println(l);
        }
            
        List<VaccineProvision> listP = dao.getAllVaccine_provision();
        for (VaccineProvision o : listP) {
            System.out.println("\n"+o);
        }
//
//        int totalVaccine = dao.getTotalVaccine();
//        System.out.println("\n"
//                + "Total Vaccine: " + totalVaccine);
    }
}

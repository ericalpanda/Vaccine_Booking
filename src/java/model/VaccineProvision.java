/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL VOSTRO 5510
 */
public class VaccineProvision {
    private double pricePerService;
    private int idHVP;
    private int idVaccineVP;

    public VaccineProvision() {
    }

    public VaccineProvision(double pricePerService, int idHVP, int idVaccineVP) {
        this.pricePerService = pricePerService;
        this.idHVP = idHVP;
        this.idVaccineVP = idVaccineVP;
    }

    public double getPricePerService() {
        return pricePerService;
    }

    public void setPricePerService(double pricePerService) {
        this.pricePerService = pricePerService;
    }

    public int getIdHVP() {
        return idHVP;
    }

    public void setIdHVP(int idHVP) {
        this.idHVP = idHVP;
    }

    public int getIdVaccineVP() {
        return idVaccineVP;
    }

    public void setIdVaccineVP(int idVaccineVP) {
        this.idVaccineVP = idVaccineVP;
    }

    @Override
    public String toString() {
        return "VaccineProvision{" + "pricePerService=" + pricePerService + ", idHVP=" + idHVP + ", idVaccineVP=" + idVaccineVP + '}';
    }
    
}

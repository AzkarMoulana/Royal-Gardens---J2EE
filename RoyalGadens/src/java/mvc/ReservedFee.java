/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc;

/**
 *
 * @author Ishan Darshana
 */
public class ReservedFee {
    private int fee;
    private String date;
    private int buyer;

    /**
     * @return the fee
     */
    public int getFee() {
        return fee;
    }

    /**
     * @param fee the fee to set
     */
    public void setFee(int fee) {
        this.fee = fee;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the buyer
     */
    public int getBuyer() {
        return buyer;
    }

    /**
     * @param buyer the buyer to set
     */
    public void setBuyer(int buyer) {
        this.buyer = buyer;
    }
    
}

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
public class PublishedFee {
    private int fee;
    private String date;
    private int seller;

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
     * @return the seller
     */
    public int getSeller() {
        return seller;
    }

    /**
     * @param seller the seller to set
     */
    public void setSeller(int seller) {
        this.seller = seller;
    }
    
    
}

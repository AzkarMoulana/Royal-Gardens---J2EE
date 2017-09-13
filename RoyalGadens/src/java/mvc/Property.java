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
public class Property {

    private String name;
    private String address;
    private String description;
    private String images;
    private double price;
    private double landSize;
    private double houseSize;
    private String outdoorfeatures;
    private String city;
    private int bedRoom;
    private int idplot;
    private int livingRoom;
    private int parking;
    private int kichen;
    private int bathRooms;
    private int seller;
    private int buyer;
    
    //seller details
    private String sellerName;
    private String contact;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getLandSize() {
        return landSize;
    }

    public void setLandSize(double landSize) {
        this.landSize = landSize;
    }

    public double getHouseSize() {
        return houseSize;
    }

    public void setHouseSize(double houseSize) {
        this.houseSize = houseSize;
    }

    public String getOutdoorfeatures() {
        return outdoorfeatures;
    }

    public void setOutdoorfeatures(String outdoorfeatures) {
        this.outdoorfeatures = outdoorfeatures;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getBedRoom() {
        return bedRoom;
    }

    public void setBedRoom(int bedRoom) {
        this.bedRoom = bedRoom;
    }

    public int getLivingRoom() {
        return livingRoom;
    }

    public void setLivingRoom(int livingRoom) {
        this.livingRoom = livingRoom;
    }

    public int getParking() {
        return parking;
    }

    public void setParking(int parking) {
        this.parking = parking;
    }

    public int getKichen() {
        return kichen;
    }

    public void setKichen(int kichen) {
        this.kichen = kichen;
    }

    public int getBathRooms() {
        return bathRooms;
    }

    public void setBathRooms(int bathRooms) {
        this.bathRooms = bathRooms;
    }

    public int getSeller() {
        return seller;
    }

    public void setSeller(int seller) {
        this.seller = seller;
    }

    public int getBuyer() {
        return buyer;
    }

    public void setBuyer(int buyer) {
        this.buyer = buyer;
    }

    /**
     * @return the idplot
     */
    public int getIdplot() {
        return idplot;
    }

    /**
     * @param idplot the idplot to set
     */
    public void setIdplot(int idplot) {
        this.idplot = idplot;
    }

    /**
     * @return the sellerName
     */
    public String getSellerName() {
        return sellerName;
    }

    /**
     * @param sellerName the sellerName to set
     */
    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        this.contact = contact;
    }

}

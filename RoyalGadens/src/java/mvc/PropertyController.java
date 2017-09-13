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
public class PropertyController {

    Property model;
    PropertyView view;

    public PropertyController(Property model, PropertyView view) {
        this.model = model;
        this.view = view;
    }

    public String getName() {
        return model.getName();
    }

    public void setName(String name) {
        model.setName(name);
    }

    public String getAddress() {
        return model.getAddress();
    }

    public void setAddress(String address) {
        model.setAddress(address);
    }

    public String getDescription() {
        return model.getDescription();
    }

    public void setDescription(String description) {
        model.setDescription(description);
    }

    public String getImages() {
        return model.getImages();
    }

    public void setImages(String images) {
        model.setImages(images);
    }

    public double getPrice() {
        return model.getPrice();
    }

    public void setPrice(double price) {
        model.setPrice(price);
    }

    public double getLandSize() {
        return model.getLandSize();
    }

    public void setLandSize(double landSize) {
        model.setLandSize(landSize);
    }

    public double getHouseSize() {
        return model.getHouseSize();
    }

    public void setHouseSize(double houseSize) {
        model.setHouseSize(houseSize);
    }

    public String getOutdoorfeatures() {
        return model.getOutdoorfeatures();
    }

    public void setOutdoorfeatures(String outdoorfeatures) {
        model.setOutdoorfeatures(outdoorfeatures);
    }

    public String getCity() {
        return model.getCity();
    }

    public void setCity(String city) {
        model.setCity(city);
    }

    public int getBedRoom() {
        return model.getBedRoom();
    }

    public void setBedRoom(int bedRoom) {
        model.setBedRoom(bedRoom);
    }

    public int getLivingRoom() {
        return model.getLivingRoom();
    }

    public void setLivingRoom(int livingRoom) {
        model.setLivingRoom(livingRoom);
    }

    public int getParking() {
        return model.getParking();
    }

    public void setParking(int parking) {
        model.setParking(parking);
    }

    public int getKichen() {
        return model.getKichen();
    }

    public void setKichen(int kichen) {
        model.setKichen(kichen);
    }

    public int getBathRooms() {
        return model.getBathRooms();
    }

    public void setBathRooms(int bathRooms) {
        model.setBathRooms(bathRooms);
    }

    public int getSeller() {
        return model.getSeller();
    }

    public void setSeller(int seller) {
        model.setSeller(seller);
    }

    public int getBuyer() {
        return model.getBuyer();
    }

    public void setBuyer(int buyer) {
        model.setBuyer(buyer);
    }

}

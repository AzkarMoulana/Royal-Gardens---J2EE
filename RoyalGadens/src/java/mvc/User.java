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
public class User {

    private int id;
    private String nic;
    private String image;
    private String name;
    private String username;
    private String password;
    private String email;
    private String contact;
    private String location;
    private String status;
    private String ip;
    private String lastVisited;

    /**
     * @return the nic
     */
    public String getNic() {
        return nic;
    }

    /**
     * @param nic the nic to set
     */
    public void setNic(String nic) {
        this.nic = nic;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
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

    /**
     * @return the location
     */
    public String getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param aImage the image to set
     */
    public void setImage(String aImage) {
        image = aImage;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param aStatus the status to set
     */
    public void setStatus(String aStatus) {
        status = aStatus;
    }

    /**
     * @return the ip
     */
    public  String getIp() {
        return ip;
    }

    /**
     * @param aIp the ip to set
     */
    public void setIp(String aIp) {
        ip = aIp;
    }

    /**
     * @return the lastVisited
     */
    public String getLastVisited() {
        return lastVisited;
    }

    /**
     * @param aLastVisited the lastVisited to set
     */
    public void setLastVisited(String aLastVisited) {
        lastVisited = aLastVisited;
    }

}

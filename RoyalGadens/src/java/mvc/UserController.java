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
public class UserController {

    private User model;
    private UserView view;

    public UserController(User model, UserView view) {
        this.model = model;
        this.view = view;
    }

    public void setStudentName(String name) {
        model.setName(name);
    }

    public String getStudentName() {
        return model.getName();
    }

    /**
     * @return the nic
     */
    public String getNic() {
        return model.getNic();
    }

    /**
     * @param nic the nic to set
     */
    public void setNic(String nic) {
        model.setNic(nic);
    }

    /**
     * @return the name
     */
    public String getName() {
        return model.getName();
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        model.setName(name);
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return model.getUsername();
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        model.setUsername(username);
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return model.getPassword();
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        model.setPassword(password);
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return model.getEmail();
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        model.setEmail(email);
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return model.getContact();
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        model.setContact(contact);
    }

    /**
     * @return the location
     */
    public String getLocation() {
        return model.getLocation();
    }

    /**
     * @param location the location to set
     */
    public void setLocation(String location) {
        model.setLocation(location);
    }

    /**
     * @return the id
     */
    public int getId() {
        return model.getId();
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        model.setId(id);
    }

    public void updateView() {
        view.printUserDetails(model.getId(), model.getNic(), model.getName(), model.getUsername(), model.getPassword(), model.getEmail(),
                model.getContact(), model.getLocation());
    }

    public String getImage() {
        return model.getImage();
    }

    /**
     * @param aImage the image to set
     */
    public void setImage(String aImage) {
        model.setImage(aImage);
    }

    public String getStatus() {
        return model.getStatus();
    }

    /**
     * @param aStatus the status to set
     */
    public void setStatus(String aStatus) {
        model.setStatus(aStatus);
    }

}

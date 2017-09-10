package models;

import java.util.ArrayList;
import java.util.Arrays;


public class Human {
  protected int id;
  protected String first_name;
  protected String last_name;
  protected String middleName;

  protected ArrayList<Car> car;
  protected City city;

  public Human(int id) {
    this.id = id;
    this.car = new ArrayList<Car>();
  }

  public void setFirstName(String first_name) {
    this.first_name = first_name;
  }

  public void setName(String first_name, String last_name, String middleName) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.middleName = middleName;
  }

  public void setName(String first_name, String last_name) {
    this.first_name = first_name;
    this.last_name = last_name;
  }

  public void setCity(City city) {
    this.city = city;
  }

  public City getCity() {
    return this.city;
  }

  public void addCar(Car car) {
    this.car.add(car);
  }

  public ArrayList<Car> getCar() {
    return this.car;
  }

  public String getFullName() {
    String[] fio = { this.first_name, this.middleName, this.last_name };
    fio = Arrays.stream(fio).filter(s -> s != null && !s.isEmpty()).toArray(String[]::new);

    return String.join(" ", fio);
  }

  public String toString() {
    return this.id + ":\t" + this.getFullName() + ";\t" + this.car + ";\t" + this.city;
  }
}

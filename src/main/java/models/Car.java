package models;

public class Car extends Base {
  private String gos;

  public Car(int id, String name, String gos) {
    this.id = id;
    this.name = name;
    this.gos = gos;
  }

  public String toString() {
    return this.name + " - " + this.gos;
  }
}

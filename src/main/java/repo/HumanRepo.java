package repo;
import java.util.ArrayList;
import java.util.HashMap;
import helper.Factory;
import helper.Db;
import models.Human;
import models.City;
import models.Car;

public class HumanRepo {
  public static HashMap<String, Human> find(ArrayList<HashMap<String, String>> filter) {


    String query = getQueryByFilter(filter);

    Db db = new Db();
    HashMap<String, Human> humans = db.query(query, result -> {

      HashMap<String, Human> humans1 = new HashMap<String, Human>();
      Human human;
      String human_id;

      while ( result.next() ) {
        human_id = result.getString("id");

        if (humans1.get(human_id) == null) {
          human = new Human(result.getInt("id"));
        } else {
          human = humans1.get(human_id);
        }
        human.setName(result.getString("last_name"), result.getString("first_name"), result.getString("middle_name"));

        if (result.getString("human_city_id") != null) {
          human.setCity(new City(result.getInt("human_city_id"), result.getString("human_city_name")));
        }

        if (result.getString("human_car_id") != null) {
          human.addCar(new Car(result.getInt("human_car_id"), result.getString("human_car_name"), result.getString("human_car_gos")));
        }

        humans1.put(human_id, human);
        // humans1.add(human);
      }
      return humans1;
    });

    // Human human = new Human(42);
    // human.setName("Константин", "Поленков");
    // humans.add(human);

    return humans;
  }

  // т.к. в задании не сказано что подразумевается под "информацией о пользователе, то в данном случае будем выводить всю доступную"
  // В будущем для таких целей пишется номальный билдер с джойнами и селектами, и соответсвенно тогда нам не нужно всегда джойнить все таблицы.
  // ну и плюс билдер позволит реализовать пагинацию, можно конечно тут сделать самую элементарную добабвив параметр
  public static String getQueryByFilter(ArrayList<HashMap<String, String>> filter) {
    // предполагается что у машины может быть только один хозяин (если нужно много ко многим то выносим связи в отдельную таблицу.)
    String query =  "SELECT humans.id, humans.last_name, humans.first_name, humans.middle_name, city.name as human_city_name, city.id as human_city_id, cars.name as human_car_name, cars.gos as human_car_gos, cars.id as human_car_id " +
                    "FROM humans INNER JOIN city ON humans.city_id = city.id LEFT JOIN cars ON humans.id = cars.owner_id " +
                    "WHERE 1 = 1";

    HashMap<String, String> filter_to_sql = new HashMap();
    filter_to_sql.put("city", "city.name");
    filter_to_sql.put("car", "cars.name");
    filter_to_sql.put("car_gos", "cars.gos");
    filter_to_sql.put("first_name", "humans.first_name");
    filter_to_sql.put("last_name", "humans.last_name");
    filter_to_sql.put("middle_name", "humans.middle_name");

    for (HashMap<String, String> filter_item : filter) {
      if (filter_to_sql.get(filter_item.get("key")) == null) {
        continue;
      }

      query += " AND " + filter_to_sql.get(filter_item.get("key")) + " like " + helper.Other.escapeString(filter_item.get("value"));
    }

    query += " LIMIT 1000";

    return query;
  }
}

package db;

import model.Tasks;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Tasks> tasks = new ArrayList<>();
    private static Long id = 5L;

    static {
        tasks.add(new Tasks(1L, "JAVA EE", "Java EE", "2021-10-23", true));
        tasks.add(new Tasks(2L, "Leisan Nakypbek", "Kyzylyan Kakpak", "2023-10-24", true));
        tasks.add(new Tasks(3L, "Kasymbek Zhaksylyk", "Kazygurt OKO", "2023-11-07", false));
        tasks.add(new Tasks(4L, "Tursyn Assem", "Komsomol", "2023-11-07", false));
    }

    public static void addTask(Tasks task) {
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static ArrayList<Tasks> getTasks() {
        return tasks;
    }

    public static Tasks getTask(long id) {
        for (Tasks task : tasks) {
            if (task.getId() == id) {
                return task;
            }
        }
        return null;
    }

    public static ArrayList<Tasks> getAllTasks() {
        return tasks;
    }

    public static void deleteTask(Long id) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == id) {
                tasks.remove(i);
                break;
            }
        }
    }

    public static Tasks updateTask(Tasks task) {
        for (int i = 0; i < tasks.size(); i++) {
            if (task.getId() == tasks.get(i).getId()) {
                tasks.set(i, task);
                return task;
            }
        }
        return null;
    }
}

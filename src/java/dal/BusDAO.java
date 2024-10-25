/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Bus;
import java.sql.*;
import model.User;

/**
 *
 * @author olymp
 */
public class BusDAO extends DBContext {

    public List<Bus> getAllBuses() {
        List<Bus> listB = new ArrayList<>();
        try {
            String sql = "select * from Buses";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bus bus = new Bus();
                bus.setBusId(rs.getInt("BusId"));
                bus.setPlate(rs.getString("Plate"));
                bus.setModel(rs.getString("Model"));
                bus.setColor(rs.getString("Color"));
                bus.setCapacity(rs.getInt("Capacity"));
                bus.setBusId(rs.getInt("RouteId"));
                listB.add(bus);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return listB;
    }

    public boolean addBus(Bus bus) {
        String sql = "INSERT INTO [Buses]\n"
                + "           ([Plate]\n"
                + "           ,[Capacity]\n"
                + "           ,[Model]\n"
                + "           ,[Color]\n"
                + "           ,[RouteId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, bus.getPlate());
            statement.setInt(2, bus.getCapacity());
            statement.setString(3, bus.getModel());
            statement.setString(4, bus.getColor());
            statement.setInt(5, bus.getRouteId());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean editBus(Bus bus) {
        String sql = "UPDATE [Buses] SET "
                + "[Plate] = ?, "
                + "[Capacity] = ?, "
                + "[Model] = ?, "
                + "[Color] = ?, "
                + "[RouteId] = ? "
                + "WHERE [BusId] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, bus.getPlate());
            statement.setInt(2, bus.getCapacity());
            statement.setString(3, bus.getModel());
            statement.setString(4, bus.getColor());
            statement.setInt(5, bus.getRouteId());
            statement.setInt(6, bus.getBusId());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int countBuses() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Buses";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return count;
    }

    public boolean deleteBus(int busId) {
        String sql = "DELETE FROM [Buses] WHERE [BusId] = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, busId);
            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}

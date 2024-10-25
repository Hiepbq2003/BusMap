/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Stop;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author olymp
 */
public class StopDAO extends DBContext {

    public List<Stop> getAllStops() {
        List<Stop> lStop = new ArrayList<>();
        try {
            String sql = "select * from Stops";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Stop nStop = new Stop();
                nStop.setStopId(rs.getInt("StopId"));
                nStop.setStopName(rs.getString("StopName"));
                nStop.setLatitude("0");
                nStop.setLongitude("0");
                lStop.add(nStop);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return lStop;
    }

    public List<Stop> getAllStopsByRouteId(int routeId, int direction) {
        List<Stop> lStop = new ArrayList<>();
        try {
            String sql = "SELECT s.StopId\n"
                    + "      ,[StopName]\n"
                    + "  FROM [BusTracking].[dbo].[Stops] s JOIN Route_Stop rs\n"
                    + "  ON s.StopId = rs.StopId WHERE rs.RouteId = ? AND rs.Direction = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, routeId);
            if (direction == 1) {
                st.setString(2, "Forward");
                sql += " order by id asc";
            } else {
                st.setString(2, "Backward");
                sql += " order by id desc";
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Stop nStop = new Stop();
                nStop.setStopId(rs.getInt("StopId"));
                nStop.setStopName(rs.getString("StopName"));
                nStop.setLatitude("0");
                nStop.setLongitude("0");
                lStop.add(nStop);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return lStop;
    }

    public List<Stop> searchStops(String query) {
        List<Stop> lStop = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Stops WHERE StopName LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + query + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Stop nStop = new Stop();
                nStop.setStopId(rs.getInt("StopId"));
                nStop.setStopName(rs.getString("StopName"));
                nStop.setLatitude("0");
                nStop.setLongitude("0");
                lStop.add(nStop);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
        return lStop;
    }

    public int addStop(Stop stop) {
        int generatedKey = -1;
        try {
            String sql = "INSERT INTO Stops (StopName) VALUES (?)";
            PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            st.setString(1, stop.getStopName());

            int rowsInserted = st.executeUpdate();
            if (rowsInserted > 0) {
                ResultSet generatedKeys = st.getGeneratedKeys();
                if (generatedKeys.next()) {
                    generatedKey = generatedKeys.getInt(1);
                }
                System.out.println("A new stop with StopId " + generatedKey + " was inserted successfully!");
            }
        } catch (SQLException e) {
            System.err.println("Error inserting new stop: " + e.getMessage());
        }
        return generatedKey;
    }

    public static void main(String[] args) {
        StopDAO sDAO = new StopDAO();
        List<Stop> sList = sDAO.searchStops("220");
        for (Stop stop : sList) {
            System.out.println(stop);
        }
    }
}

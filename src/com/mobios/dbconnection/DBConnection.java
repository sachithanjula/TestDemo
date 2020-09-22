package com.mobios.dbconnection;

import java.sql.*;

public class DBConnection
{
    public Connection conn;
    private Statement statement;
    public static DBConnection db;

    private DBConnection() {

        String url = "jdbc:mysql://localhost:3306/";
        String driver = "com.mysql.cj.jdbc.Driver";
        String userName = "root";



        String dbName = "TestDemo?autoReconnect=true&allowLoadLocalInfile=true&useUnicode=yes&characterEncoding=UTF-8";
        String password = "h8AW@ePfE75PGUrhv";

//        String dbName = "nethfmbot?autoReconnect=true&allowLoadLocalInfile=true&useUnicode=yes&characterEncoding=UTF-8";
//        String password = "root";

        try {
            Class.forName(driver).newInstance();
            this.conn = (Connection) DriverManager.getConnection(url + dbName, userName, password);
        } catch (Exception sqle) {
            sqle.printStackTrace();
        }
    }

    /**
     * @return MysqlConnect Database connection object
     */
    public static synchronized DBConnection getDbCon() {
        if (db == null) {
            db = new DBConnection();
        }
        return db;

    }

    /**
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not available
     * @throws SQLException
     */
    public ResultSet query(String query) throws SQLException {
        statement = db.conn.createStatement();
        ResultSet res = statement.executeQuery(query);
        return res;
    }

    /**
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException
     * @desc Method to insert data to a table
     */
    public int insert(String insertQuery) throws SQLException {
        statement = db.conn.createStatement();
        int result = statement.executeUpdate(insertQuery);
        return result;

    }

    public int update(String sql) throws SQLException {
        PreparedStatement preparedStmt = db.conn.prepareStatement(sql);

        // execute the java preparedstatement
        return preparedStmt.executeUpdate();
    }
}

package com.mobios.utils;

import com.mobios.dbconnection.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class test
{
    public static void main(String[] args)
    {

        int a = 10;

        if (a > 100)
        {
            System.out.println("ok");
        }
        else
            System.out.println("nok");

        if (a < 100)
        {
            System.out.println("2ok");
        }

//        int loopCount = 0;
//        int recordsCount = 0;
//        int j = 0;
//
//        List<String> userIds =  new ArrayList<>();
//
//        try
//        {
//            PreparedStatement preparedStatement = DBConnection.getDbCon().conn.prepareStatement("SELECT COUNT(id) FROM event_table WHERE subscription = 'true' ");
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next())
//            {
//                recordsCount = resultSet.getInt(1);
//            }
//
//            System.out.println(recordsCount);
//
//            loopCount = (recordsCount / 300) + 1;
//            System.out.println(loopCount);
//
//            for (int i = 0; i < loopCount; i++)
//            {
//
//                System.out.println("j============= "+j);
//
//                PreparedStatement preparedStatement1 = DBConnection.getDbCon().conn.prepareStatement("SELECT id, user_id FROM event_table WHERE subscription = 'true' LIMIT 300 OFFSET "+j);
//                ResultSet resultSet1 = preparedStatement1.executeQuery();
//
//                while (resultSet1.next())
//                {
//                    System.out.println(resultSet1.getString("id") + " = " + resultSet1.getString("user_id"));
//                    //userIds.add(resultSet1.getString("user_id"));
//                    System.out.println("j+++++"+j);
//                    userIds.add(resultSet1.getString("user_id"));
//
//                    for(String a : userIds)
//                    {
//                        System.out.println("j******"+j);
//                        System.out.println("a******"+a);
//                    }
//
//                    j++;
//                }
//
//                System.out.println(userIds.size());
//            }
//
//        }catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println("event save error");
//        }
    }
}

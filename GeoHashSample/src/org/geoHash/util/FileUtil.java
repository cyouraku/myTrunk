package org.geoHash.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HD800241
 *
 */
public class FileUtil {

    public static void writeToFile(String strToWrite){
        try {

            File file = new File("C:\\Users\\HD800241\\Documents\\Trunk\\LS09_Works\\GeoHashSample\\data\\CrawlerDB.txt");

            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile(),true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(strToWrite);
            bw.newLine();
            bw.close();


        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args){
        removeRedundant();
    }

    //用来删除txt中重复的项目
    public static void removeRedundant(){

        String filePath ="/Users/mike/Desktop/DB.txt";


        List<String> list = new ArrayList<String>();

        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8")); // 指定读取文件的编码格式，要和写入的格式一致，以免出现中文乱码,
//            String str = null;
            while (true) {

               String name = reader.readLine();
               String address = reader.readLine();
               String location = reader.readLine();
               String hash = reader.readLine();

                if (!list.contains(name)){
                    list.add(name);

                    writeToFile(name);
                    writeToFile(address);
                    writeToFile(location);
                    writeToFile(hash);
                    writeToFile("\n");

                }

                reader.readLine();
                reader.readLine();
                //System.out.println(str);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }

}
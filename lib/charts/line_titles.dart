

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles{
  static getTitleData()=> FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      margin: 8,
      reservedSize: 22,
      getTextStyles: (value) => const TextStyle(
        color: Colors.black,
        fontSize: 16
      ),
      getTitles: (value){
        switch(value.toInt()){
          case 1:
            return "Mon";
          case 2:
            return "Tue";
          case 3:
            return "Wed";
          case 4:
            return "Thurs";
          case 5:
            return "Fri";
          case 6:
            return "Sat";
          case 7:
            return "Sun";

        }
        return '';
      }
    ),
    leftTitles: SideTitles(
      showTitles: true,
        getTextStyles: (value) => const TextStyle(
            color: Colors.black,
            fontSize: 16
        ),
        reservedSize: 78,
        margin: 12,
        getTitles: (value){
          switch(value.toInt()){
            case 1:
              return "Bad";
            case 2:
              return "Avergae";
            case 3:
              return "Good";
          }
          return '';
        }
    )
  );

}
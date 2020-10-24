package com.scuba.information;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class InformationVO {
private String CountryName,CountryImage,CityName,CityExp,Season;
private int AveTemper;
private double CityXpoint,CityYpoint;
}

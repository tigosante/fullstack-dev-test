export type CountryIfoDataType = {
  city: string;
  geonameid: string;
  subcountry: string;
};

export type CountryDataType = Map<string, CountryIfoDataType[]>;

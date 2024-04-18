import * as fs from "fs";
import { parse } from "csv-parse";
import { CountryDataType, CountryIfoDataType } from "../shared/types";

export async function getDataFromFile(
  filePath: string
): Promise<CountryDataType> {
  if (filePath.trim() === "") {
    throw Error("path is empty!");
  }

  const records = new Map<string, CountryIfoDataType[]>();
  const stream = fs
    .createReadStream(filePath)
    .pipe(parse({ delimiter: ",", from_line: 2 }));

  return new Promise<CountryDataType>((resolve, reject) => {
    stream
      .on("data", function (row: string[]) {
        const [city, country, subcountry, geonameid] = row;
        const data = records.get(country) ?? [];
        data.push({ city, subcountry, geonameid });
        records.set(country, data);
      })
      .on("end", async function () {
        if (records.size == 0) {
          reject(Error("records is empty!"));
          return;
        }
        resolve(records);
      })
      .on("error", function (error) {
        reject(error);
      });
  });
}

import { fireStoreDB } from ".";
import { Logger } from "../shared/logger";
import { CountryDataType } from "../shared/types";

export async function saveDataInDB(records: CountryDataType): Promise<void> {
  const db = fireStoreDB();
  const promises: Promise<any>[] = [];
  Logger.success("database connection created!");

  records.forEach((cities, country) => {
    promises.push(db.collection("countries").doc(country).set({ cities }));
  });
  Logger.success("data ready for recording in the database!");
  Logger.info(`Size: ${promises.length}`);

  await Promise.all(promises).then(function (value) {
    Logger.success("data recording completed successfully!");
    Logger.info(`Size: ${value.length}`);
  });
}

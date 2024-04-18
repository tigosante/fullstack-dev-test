import { fireStoreDB } from ".";
import { CountryDataType } from "../shared/types";

export async function saveDataInDB(records: CountryDataType): Promise<void> {
  const db = fireStoreDB();
  const promises: Promise<any>[] = [];
  records.forEach((cities, country) => {
    promises.push(db.collection("countries").doc(country).set({ cities }));
  });
  await Promise.all(promises);
}

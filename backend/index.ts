import { getDataFromFile, saveDataInDB } from "./functions";
import { Logger } from "./shared/logger";
import * as dotenv from "dotenv";

dotenv.config();

async function run(): Promise<void> {
  try {
    const data = await getDataFromFile(process.env.FILE_PATH ?? "");
    await saveDataInDB(data);
  } catch (error) {
    console.error(error);
  }
}

run();

import { getDataFromFile, saveDataInDB } from "./functions";
import * as dotenv from "dotenv";

dotenv.config();

async function run(): Promise<void> {
  try {
    const data = await getDataFromFile(process.env.FILE_PATH ?? "");
    await saveDataInDB(data);
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}

run();

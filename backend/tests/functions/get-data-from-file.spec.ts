import { getDataFromFile } from "../../functions/index";
import { afterEach, describe, expect, it, jest } from "@jest/globals";
import * as dotenv from "dotenv";

jest.mock("fs");
dotenv.config();

describe("getDataFromFile", () => {
  let mockCreateReadStream = jest.fn();

  afterEach(() => {
    jest.clearAllMocks();
  });

  it("throws error for empty filepath", async () => {
    expect(getDataFromFile("")).rejects.toThrowError(Error("path is empty!"));
    expect(mockCreateReadStream).not.toHaveBeenCalled();
  });
});

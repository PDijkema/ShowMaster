/*
package nl.makeitwork.Showmaster.excel;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.*;

public class ApachePOIExcelRead {

    private List<String> fieldNames = new ArrayList<String>();
    private Workbook workbook = null;
    private String excelBestandsNaam = "";

    public ApachePOIExcelRead(String excelBestandsNaam) {
        this.excelBestandsNaam = excelBestandsNaam;
        initialize();
    }

    private void initialize() {
        setWorkbook(new XSSFWorkbook());
    }

    public void closeWorksheet() {
        FileOutputStream fileOut;
        try {
            fileOut = new FileOutputStream(getWorkbookName());
            getWorkbook().write(fileOut);
            fileOut.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


        try {

            FileInputStream excelBestand = new FileInputStream(new File(bestandLocatie));
            Workbook workbook = new XSSFWorkbook(excelBestand);
            Sheet sheet = workbook.getSheetAt(0);

            Map<Integer, List<String>> data = new HashMap<>();
            int i = 0;
            for (Row row : sheet) {
                data.put(i, new ArrayList<String>());
                for (Cell cell : row) {
                    switch (cell.getCellTypeEnum()) {
                        case STRING:
                            data.get(new Integer(i)).add(cell.getRichStringCellValue().getString());
                            break;
                        case NUMERIC:
                            if (DateUtil.isCellDateFormatted(cell)) {
                                data.get(i).add(cell.getDateCellValue() + "");
                            } else {
                                data.get(i).add(cell.getNumericCellValue() + "");
                            }
                            break;
                        case BOOLEAN:
                            data.get(i).add(cell.getBooleanCellValue() + "");
                            break;
                        case FORMULA:
                            data.get(i).add(cell.getCellFormula() + "");
                            break;
                        default:
                            data.get(new Integer(i)).add(" ");
                    }
                }
                i++;
            }
            System.out.println();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    public List<String> getFieldNames() {
        return fieldNames;
    }

    public void setFieldNames(List<String> fieldNames) {
        this.fieldNames = fieldNames;
    }

    public Workbook getWorkbook() {
        return workbook;
    }

    public void setWorkbook(Workbook workbook) {
        this.workbook = workbook;
    }

    public String getExcelBestandsNaam() {
        return excelBestandsNaam;
    }

    public void setExcelBestandsNaam(String excelBestandsNaam) {
        this.excelBestandsNaam = excelBestandsNaam;
    }
}
*/




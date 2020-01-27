package nl.makeitwork.Showmaster.controller;

import io.github.millij.poi.SpreadsheetReadException;
import io.github.millij.poi.ss.reader.XlsReader;
import io.github.millij.poi.ss.reader.XlsxReader;
// import nl.makeitwork.Showmaster.excel.ExcelPOIHelper;
import nl.makeitwork.Showmaster.model.Voorstelling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
public class ExcelController {

    private String fileLocation;

    /*@Resource(name = "excelPOIHelper")
    private ExcelPOIHelper excelPOIHelper;*/

    @GetMapping("/planner/excelProcessing")
    public String getExcelProcessingPage() {
        return "excel";
    }

    @PostMapping("/planner/uploadExcelFile")
    public String uploadFile(Model model, MultipartFile file) throws IOException {
        InputStream in = file.getInputStream();
        File currDir = new File(".");
        String path = currDir.getAbsolutePath();
        fileLocation = path.substring(0, path.length() - 1) + file.getOriginalFilename();
        FileOutputStream f = new FileOutputStream(fileLocation);
        int ch = 0;
        while ((ch = in.read()) != -1) {
            f.write(ch);
        }
        f.flush();
        f.close();
        model.addAttribute("message", "Uploaden van bestand: " + file.getOriginalFilename()
                + " is geslaagd.");
        return "excel";
    }

    @GetMapping("/planner/excel/voorstelling/toevoegen")
    public String excelVoorstellingToevoegen(Model model) throws SpreadsheetReadException {

        if (fileLocation != null) {
            if (fileLocation.endsWith(".xlsx")) {
                readExcelXlsx(fileLocation);
            } else if (fileLocation.endsWith(".xls")) {
                readExcelXls(fileLocation);
            } else {
                model.addAttribute("message", "Geen geschikt Excelbestand!");
            }
        } else {
            model.addAttribute("message", "Geen bestand beschikbaar! A.u.b. een Excelbestand uploaden.");
        }
        return "excel";
    }

    public void readExcelXlsx(String fileLocation) throws SpreadsheetReadException {

        final File xlsxFile = new File(fileLocation);
        final XlsxReader reader = new XlsxReader();
        List<Voorstelling> voorstellingen = reader.read(Voorstelling.class, xlsxFile);
        for (Voorstelling nieuweVoorstelling : voorstellingen) {
            System.out.println(nieuweVoorstelling);
        }
    }

    public void readExcelXls(String fileLocation) throws SpreadsheetReadException {

        final File xlsFile = new File(fileLocation);
        final XlsReader reader = new XlsReader();
        List<Voorstelling> voorstellingen = reader.read(Voorstelling.class, xlsFile);
        for (Voorstelling nieuweVoorstelling : voorstellingen) {
            System.out.println(nieuweVoorstelling);
        }
    }
}

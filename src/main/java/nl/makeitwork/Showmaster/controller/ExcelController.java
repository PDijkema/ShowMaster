package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.excel.ExcelPOIHelper;
import nl.makeitwork.Showmaster.excel.MyCell;
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
import java.util.Map;

@Controller
public class ExcelController {

    private String fileLocation;

    @Resource(name = "excelPOIHelper")
    private ExcelPOIHelper excelPOIHelper;

    @GetMapping("/excelProcessing")
    public String getExcelProcessingPage() {
        return "excel";
    }

    @PostMapping("/uploadExcelFile")
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

    @GetMapping("/readPOI")
    public String readPOI(Model model) throws IOException {

        if (fileLocation != null) {
            if (fileLocation.endsWith(".xlsx") || fileLocation.endsWith(".xls")) {
                Map<Integer, List<MyCell>> data
                        = excelPOIHelper.readExcel(fileLocation);
                model.addAttribute("data", data);
            } else {
                model.addAttribute("message", "Geen geschikt Excelbestand!");
            }
        } else {
            model.addAttribute("message", "Geen bestand beschikbaar! A.u.b. een Excelbestand uploaden.");
        }
        return "excel";
    }
}

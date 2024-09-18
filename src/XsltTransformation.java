import java.io.File;

import javax.naming.spi.DirStateFactory.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

public class XsltTransformation {

	public static void main(String[] args) {
		 try {
			 
			 TransformerFactory transformerFactory = TransformerFactory.newInstance();
			 Source xsltSource = new StreamSource("src/Files/transform_v3.xslt");
			 Templates templates = transformerFactory.newTemplates(xsltSource);        
			 Transformer transformer = templates.newTransformer();

			 Source xmlSource = new StreamSource("src/Files/98765432.xml");
			 javax.xml.transform.Result result = new StreamResult("output.xml");

			 transformer.transform(xmlSource, result);
	            
	            System.out.println("Transformation complete!");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
}

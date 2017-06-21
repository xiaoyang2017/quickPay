package com.picc.um.cognos.utils;
/** 
Licensed Materials - Property of IBM

IBM Cognos Products: DOCS

(C) Copyright IBM Corp. 2009, 2010

US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with
IBM Corp.
*/
import javax.xml.namespace.QName;

import org.apache.axis.message.SOAPHeaderElement;
//import com.cognos.org.apache.axis.message.SOAPHeaderElement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cognos.developer.schemas.bibus._3.BiBusHeader;
import com.cognos.developer.schemas.bibus._3.RoutingInfo;


public class BIBusHeaderHelper {
	
	private static final Logger logger = LoggerFactory.getLogger(BIBusHeaderHelper.class);

	private static final String BIBUS_NS = "http://developer.cognos.com/schemas/bibus/3/";

    private static final String BIBUS_HDR = "biBusHeader";

	private static final QName BUS_QNAME = new QName(BIBUS_NS, BIBUS_HDR);
	
	// sn_dg_sdk_mng_svc_hdrs_start_2
    //Use this method when copying headers, such as for requests to services
	public static BiBusHeader getHeaderObject(SOAPHeaderElement SourceHeader, boolean isNewConversation, String RSGroup) 
	{
		if (SourceHeader == null)
			return null;
		
		BiBusHeader bibus = null;
		try {
			bibus = (BiBusHeader)SourceHeader.getValueAsType(BUS_QNAME);
            // Note BUS_QNAME expands to: 
            // new QName("http://developer.cognos.com/schemas/bibus/3/", "biBusHeader")
            
			//If the header will be used for a new conversation, clear
			//tracking information, and set routing if supplied (clear if not)
            if (isNewConversation){
                
                bibus.setTracking(null);
                
                //If a Routing Server Group is specified, direct requests to it
                if (RSGroup.length()>0) {
                    RoutingInfo routing = new RoutingInfo(RSGroup);
                    bibus.setRouting(routing);
                }                  
                else {
                    bibus.setRouting(null);
                }
            }
		} catch (Exception e) {
			
			e.printStackTrace();
			logger.error("", e);
		}
		
		return bibus;
	}
	// sn_dg_sdk_mng_svc_hdrs_end_2

    // use this method when retrieving information from header, but header is not being copied
    // for use in service requests
    public static BiBusHeader getHeaderObject(SOAPHeaderElement soapHeaderElement) 
    {
        if (soapHeaderElement == null)
            return null;
        
        BiBusHeader bibus = null;
        try {
            bibus = (BiBusHeader)soapHeaderElement.getValueAsType(BUS_QNAME);
                      
        } catch (Exception e) {
            
            e.printStackTrace();
			logger.error("", e);
        }
        
        return bibus;
    }
    
}
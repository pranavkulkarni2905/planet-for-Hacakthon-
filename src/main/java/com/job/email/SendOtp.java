package com.job.email;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;

public class SendOtp {

	public static String generateOTP()
	{
		int otpLength=6;
		Random random=new Random();

		StringBuilder sb=new StringBuilder();

		for(int i=0 ; i< otpLength ; i++)
		{
			sb.append(random.nextInt(10));
		}

		String otp=sb.toString();

		return otp;
	}
	public static void sendSms(String message,String number)
	{
//		System.out.println(message);
//		System.out.println(number);
		try
		{

			String apiKey="oVAv3TSfJFunXrUPhIQpN9Zsm8iH4ktj6egcdzx75L2wEDG0BKRW7gzdheGaO5rIq20u1DfcNQSiokMA";
			String sendId="FSTSMS";
			//important step...
			message=URLEncoder.encode(message, "UTF-8");
			String language="english";

			String route="p";


			String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;

			//sending get request using java..

			URL url=new URL(myUrl);

			HttpsURLConnection con=(HttpsURLConnection)url.openConnection();


			con.setRequestMethod("GET");

			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			con.setRequestProperty("cache-control", "no-cache");
			//logger implementation log4j library
			System.out.println("Wait..............");

			int code=con.getResponseCode();

			System.out.println("Response code : "+code);

			StringBuffer response=new StringBuffer();

			BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));

			while(true)
			{
				String line=br.readLine();
				if(line==null)
				{
					break;
				}
				response.append(line);
			}

			System.out.println(response);


		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}

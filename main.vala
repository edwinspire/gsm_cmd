//
//
//  Author:
//       Edwin De La Cruz <admin@edwinspire.com>
//
//  Copyright (c) 2013 edwinspire
//  Web Site http://edwinspire.com
//
//  Quito - Ecuador
//
//  This program is free software: you can redistri//bute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
using GLib;
using edwinspire.GSM.MODEM;
using edwinspire.Ports;

	
	/**
	* GSM-CMD
	*
	* Small application for sending text messages (sms).
	*
	* The parameters to be passed are:<<BR>>
	* 1. Port where the modem is connected.<<BR>>
	* 2. Telephone number of destination.<<BR>>
	* 3. Message<<BR>>
	* 
	* All parameters must be present.
	*
	*
	* To run on a Linux console:<<BR>>
	* ./run.sh "/dev/ttyACM0" "9600" "1234" "My sms"
	*
	* To run on a Windows console:<<BR>>
	* gsm_cmd.exe "COM1" "9600" "1234" "My sms"
	*
	* Return number > 0 is OK.
	*
	 * {{/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyects/gsm_cmd/minilogoedwinspire.png|Edwinspire}} [[https://github.com/edwinspire?tab=repositories|Edwinspire on GitHub]]
	 *
	 *	  
	 */
	public class GSM_CMD: GLib.Object {

	public static int main (string[] args) {

		ModemGSM M = new ModemGSM();
		print("%s Arg\n", args.length.to_string());

		if(args.length>4){
		
		//.with_args ("/dev/ttyS0", 2400, 8, Parity.NONE, StopBits.ONE, HandShaking.NONE);
		M.Port = args[1];
		M.Open();
		M.ATZ();		
		M.BaudRate = int.parse(args[2]);
		M.Parityp = Parity.NONE;
		M.StopBitsp = StopBits.ONE;
		M.HandShake = HandShaking.NONE;
		//print("%s\n", M.ATZ().to_string());
		var r = M.SMS_SEND(args[3], args[4], true);
		print("SMS: [%i]\n", r);
		//M.ATZ();
		M.Close();
				
		return r;
		
			}else if(args.length==3){
		
			switch(args[2]){
				case "--get-auto-baudrate":
					M.Port = args[1];
					M.Open();
					print("Baudrate detected: %s\n", M.AutoBaudRate().to_string());
					M.Close();
				break;
				
				case "--get-features":
					M.Port = args[1];
					M.Open();
					print("Features:\n");
					M.GetFeatures();
					M.Close();		
				break;
				
				case "--test":
				M.Port = args[1];
					M.Open();
					print("Baudrate detected: %s\n", M.AutoBaudRate().to_string());
					print("Features:\n");
					M.GetFeatures();
					M.Close();
				break;
				default:
					print("%s no es un comando reconocido o faltan parametros\n", args[2]);
				break;
			}
		
		return 0;
			}else{		
				warning("Error: no hay parametros suficientes para poder ejecutar el programa\n");
				return -1;
			}
		
	}
	
	
	
	
	
	
	
	
		
	
}

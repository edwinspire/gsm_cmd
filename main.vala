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
	* ./run.sh "/dev/ttyACM0" "1234" "My sms"
	*
	* To run on a Windows console:<<BR>>
	* gsm_cmd.exe "COM1" "1234" "My sms"
	*
	* Return number > 0 is OK.
	*
	 * {{/home/edwinspire/Documentos/DesarrolloSoftware/ProyectosSoftware_ng/proyects/gsm_cmd/minilogoedwinspire.png|Edwinspire}} [[https://github.com/edwinspire?tab=repositories|Edwinspire on GitHub]]
	 *
	 *	  
	 */
	public class GSM_CMD: GLib.Object {

	public static int main (string[] args) {

		if(args.length>3){
		
		ModemGSM M = new ModemGSM();
		//.with_args ("/dev/ttyS0", 2400, 8, Parity.NONE, StopBits.ONE, HandShaking.NONE);
		M.Port = args[1];
		M.Open();		
		M.BaudRate = 2400;
		M.Parityp = Parity.NONE;
		M.StopBitsp = StopBits.ONE;
		M.HandShake = HandShaking.NONE;
		//print("%s\n", M.ATZ().to_string());
		print("%i\n", M.SMS_SEND(args[2], args[3]));
		M.Close();		
		
		return 0;
			}else{		
		warning("Error: no hay parametros suficientes para poder ejecutar el programa\n");
		return -1;
		}
		
	}
	
	
	
	
	
	
	
	
		
	
}

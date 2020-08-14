			echo ""
			echo "   1) SSH & RDP Pre-Test "
			echo "   2) SSH & RDP Shutdown "
			echo "   3) SSH & RDP Post-Test "
			echo ""
			read -p "Select an option [1-3]: " option
			echo ""
			case $option in
			1)
        			sh ssh2es-pre-test.sh
			 	sh rdp2es-pre-test.sh
				exit
				;;
			2)
				sh ssh2es-shutdown.sh
				sh rdp2es-shutdown.sh
				exit
				;;
			3)
        			sh ssh2es-post-test.sh 
				sh rdp2es-post-test.sh
				exit
				;;

			esac
		done

		exit
		;;

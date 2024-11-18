
cd build
cmake ..
make


PATHSRS=/home/egor/Tasks/srsRAN_4G/build


while getopts "eups" OPTION; do
    case $OPTION in
    e)
        sudo $PATHSRS/srsenb/src/srsenb --rf.device_name=zmq --rf.device_args="fail_on_disconnect=true,tx_port=tcp://*:2000,rx_port=tcp://localhost:2001,id=enb,base_srate=23.04e6"
    ;;
	u)
        sudo $PATHSRS/srsue/src/srsue --rf.device_name=zmq --rf.device_args="tx_port=tcp://*:2005,rx_port=tcp://localhost:2006,id=ue,base_srate=23.04e6" --gw.netns=ue1

    ;;
    p)
        ./tcp_proxy 2000 2005 2006 2001 2111

    ;;
    s)
        sudo $PATHSRS/srsepc/src/srsepc
    ;;
	*)
		echo "Incorrect option"
	;;
	esac
done
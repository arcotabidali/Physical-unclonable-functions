#! /usr/bin/env python3

def fileOpen():
    f = open("placement.tcl","w")
    return f

def fileClose(f):
    f.close()

def main():
    x = 10
    y = 1
    N = 0
    strings = ["PUF:PUF_inst0|pre_PUF:pre_PUF_inst0|RO_basic:RO_basic_inst","PUF:PUF_inst0|pre_PUF:pre_PUF_inst1|RO_basic:RO_basic_inst","PUF:PUF_inst2|pre_PUF:pre_PUF_inst2|RO_basic:RO_basic_inst","PUF:PUF_inst0|pre_PUF:pre_PUF_inst3|RO_basic:RO_basic_inst"]
    f = fileOpen()

    for idx in range(4):
        for i in range(16):
            if N == 10:
                N = 0
                y += 1
            f.write("set_location_assignment LABCELL_X{0}_Y{1}_N{2} -to \"{3}{4}\"\n".format(x,y,N,strings[idx],i))
            N += 1
    
    fileClose(f)

if __name__ == "__main__":
    main()



# set_location_assignment LABCELL_X11_Y2_N0 -to "RO_basic:RO_basic_inst"


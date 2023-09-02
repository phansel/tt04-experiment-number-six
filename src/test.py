import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles




@cocotb.test()
async def test_mult(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    max_count = 1000
    dut._log.info("check all the mults lol")
    await ClockCycles(dut.clk, max_count)


@cocotb.test()
async def test_txformer(dut):
    tex = open("tex/transforms.tex", "r")
    txforms_to_test = 1
    res_dict = {}
    for x in range(txforms_to_test):
        lhs, rhs = tex.readline().split(",")
        lhs = lhs[7:]
        rhs = rhs[0:-4]
        lhs = lhs.strip()
        rhs = rhs.strip()
        lhsl = len(lhs)
        rhsl = len(rhs)
        ind = max(lhsl, rhsl)
        rhs = rhs.ljust(ind)
        lhs = lhs.ljust(ind)
        res_dict[0] = [lhs, rhs]
    tex.close()
    dut._log.info("start")
    dut._log.info("check that our expected transforms are seen")
    dut.ui_in.value = 0;
    dut.rst_n.value = 0;
    await Timer(5, units="us")
    dut.rst_n.value = 1;

    dut._log.info(len(res_dict[0][0]))
    for char in range(len(res_dict[0][0])):
        dut.clk.value = 0;
        await Timer(1, units="us")
        dut.clk.value = 1;
        await Timer(1, units="us")
        # use the chr(ord("c")) function to get ascii->char
        #dut._log.info("seeing lhs: '" + chr(dut.uio_out.value) + "'")
        #dut._log.info("seeing rhs: '" + chr(dut.uo_out.value) + "'")
        #dut._log.info("expecting lhs: '" + (res_dict[0][0][char]) + "'")
        # targeted_lhs = (res_dict[0][0][char]) + "'")
        #dut._log.info("expecting rhs: '" + (res_dict[0][1][char]) + "'")
        assert chr(dut.uio_out.value) == res_dict[0][0][char], "failed to match lhs!"
        assert chr(dut.uo_out.value) == res_dict[0][1][char], "failed to match rhs!"

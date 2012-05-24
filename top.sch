<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="EXIDO" />
        <signal name="EXICS" />
        <signal name="EXICLK" />
        <signal name="CLK_50MHZ" />
        <signal name="XLXN_63(7:0)" />
        <signal name="foo2" />
        <signal name="XLXN_82(7:0)" />
        <signal name="RS232_DCE_RXD" />
        <signal name="XLXN_91" />
        <signal name="RS232_DCE_TXD" />
        <signal name="foo" />
        <signal name="EXIDI" />
        <signal name="XLXN_161" />
        <signal name="XLXN_163" />
        <signal name="BLAH2" />
        <signal name="BLAH" />
        <signal name="PENISNET" />
        <signal name="XLXN_141(7:0)" />
        <signal name="XLXN_185(7:0)" />
        <signal name="XLXN_186" />
        <signal name="XLXN_190" />
        <signal name="XLXN_192" />
        <signal name="XLXN_193" />
        <signal name="RS232_DCE_CTS" />
        <signal name="RS232_DCE_RTS" />
        <signal name="XLXN_213" />
        <signal name="XLXN_214" />
        <signal name="DEBUG(7:0)" />
        <port polarity="Input" name="EXIDO" />
        <port polarity="Input" name="EXICS" />
        <port polarity="Input" name="EXICLK" />
        <port polarity="Input" name="CLK_50MHZ" />
        <port polarity="Input" name="RS232_DCE_RXD" />
        <port polarity="Output" name="RS232_DCE_TXD" />
        <port polarity="Output" name="EXIDI" />
        <port polarity="Output" name="RS232_DCE_CTS" />
        <port polarity="Input" name="RS232_DCE_RTS" />
        <port polarity="Output" name="DEBUG(7:0)" />
        <blockdef name="usbexi">
            <timestamp>2012-5-20T10:8:21</timestamp>
            <line x2="0" y1="224" y2="224" x1="64" />
            <rect width="64" x="320" y="148" height="24" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="84" height="24" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-448" height="696" />
        </blockdef>
        <blockdef name="fifo">
            <timestamp>2012-5-20T5:45:9</timestamp>
            <rect width="512" x="32" y="32" height="736" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="144" y2="144" x1="0" />
            <line x2="32" y1="176" y2="176" x1="0" />
            <line x2="32" y1="240" y2="240" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
            <line x2="544" y1="208" y2="208" x1="576" />
            <line x2="544" y1="240" y2="240" x1="576" />
            <line x2="544" y1="272" y2="272" x1="576" />
            <line x2="544" y1="336" y2="336" x1="576" />
            <line x2="544" y1="432" y2="432" x1="576" />
            <line x2="544" y1="528" y2="528" x1="576" />
        </blockdef>
        <blockdef name="uart">
            <timestamp>2012-5-20T7:3:2</timestamp>
            <rect width="64" x="352" y="20" height="24" />
            <line x2="416" y1="32" y2="32" x1="352" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="416" y1="-224" y2="-224" x1="352" />
            <line x2="416" y1="-288" y2="-288" x1="352" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
            <rect width="64" x="352" y="-172" height="24" />
            <line x2="352" y1="-160" y2="-160" x1="416" />
            <rect width="288" x="64" y="-320" height="376" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="usbexi" name="XLXI_6">
            <blockpin signalname="XLXN_163" name="usb_txe" />
            <blockpin signalname="XLXN_161" name="usb_rxf" />
            <blockpin signalname="EXICS" name="exi_cs" />
            <blockpin signalname="EXICLK" name="exi_clk" />
            <blockpin signalname="EXIDO" name="exi_do" />
            <blockpin name="exi_int" />
            <blockpin signalname="XLXN_82(7:0)" name="usb_data_in(7:0)" />
            <blockpin name="led" />
            <blockpin signalname="foo" name="usb_rd" />
            <blockpin signalname="XLXN_91" name="usb_wr" />
            <blockpin signalname="EXIDI" name="exi_di" />
            <blockpin signalname="XLXN_185(7:0)" name="usb_data_out(7:0)" />
            <blockpin signalname="DEBUG(7:0)" name="debug(7:0)" />
            <blockpin signalname="CLK_50MHZ" name="fastclk" />
        </block>
        <block symbolname="fifo" name="TXFIFO">
            <blockpin signalname="XLXN_185(7:0)" name="din(7:0)" />
            <blockpin signalname="XLXN_91" name="wr_en" />
            <blockpin signalname="EXICLK" name="wr_clk" />
            <blockpin signalname="PENISNET" name="rd_en" />
            <blockpin signalname="CLK_50MHZ" name="rd_clk" />
            <blockpin signalname="XLXN_141(7:0)" name="dout(7:0)" />
            <blockpin signalname="BLAH" name="full" />
            <blockpin signalname="BLAH2" name="almost_full" />
            <blockpin name="prog_full" />
            <blockpin name="overflow" />
            <blockpin name="empty" />
            <blockpin signalname="XLXN_214" name="valid" />
        </block>
        <block symbolname="fifo" name="RXFIFO">
            <blockpin signalname="XLXN_63(7:0)" name="din(7:0)" />
            <blockpin signalname="foo2" name="wr_en" />
            <blockpin signalname="CLK_50MHZ" name="wr_clk" />
            <blockpin signalname="foo" name="rd_en" />
            <blockpin signalname="EXICLK" name="rd_clk" />
            <blockpin signalname="XLXN_82(7:0)" name="dout(7:0)" />
            <blockpin signalname="XLXN_192" name="full" />
            <blockpin signalname="XLXN_193" name="almost_full" />
            <blockpin name="prog_full" />
            <blockpin name="overflow" />
            <blockpin name="empty" />
            <blockpin signalname="XLXN_186" name="valid" />
        </block>
        <block symbolname="inv" name="XLXI_18">
            <blockpin signalname="XLXN_186" name="I" />
            <blockpin signalname="XLXN_161" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_19">
            <blockpin signalname="BLAH" name="I0" />
            <blockpin signalname="BLAH2" name="I1" />
            <blockpin signalname="XLXN_163" name="O" />
        </block>
        <block symbolname="uart" name="XLXI_14">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_190" name="dataInValid" />
            <blockpin signalname="RS232_DCE_RXD" name="uart_rx" />
            <blockpin signalname="XLXN_141(7:0)" name="dataIn(7:0)" />
            <blockpin signalname="PENISNET" name="rd_req" />
            <blockpin signalname="foo2" name="wr_req" />
            <blockpin signalname="RS232_DCE_TXD" name="uart_tx" />
            <blockpin signalname="XLXN_63(7:0)" name="dataout(7:0)" />
            <blockpin name="debug(3:0)" />
        </block>
        <block symbolname="and2" name="XLXI_21">
            <blockpin signalname="XLXN_214" name="I0" />
            <blockpin signalname="XLXN_213" name="I1" />
            <blockpin signalname="XLXN_190" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_22">
            <blockpin signalname="XLXN_193" name="I0" />
            <blockpin signalname="XLXN_192" name="I1" />
            <blockpin signalname="RS232_DCE_CTS" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_23">
            <blockpin signalname="RS232_DCE_RTS" name="I" />
            <blockpin signalname="XLXN_213" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1040" y="1248" name="XLXI_6" orien="R0">
        </instance>
        <branch name="EXIDI">
            <wire x2="1456" y1="832" y2="832" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1456" y="832" name="EXIDI" orien="R0" />
        <iomarker fontsize="28" x="944" y="832" name="EXICS" orien="R180" />
        <branch name="EXICS">
            <wire x2="1040" y1="832" y2="832" x1="944" />
        </branch>
        <iomarker fontsize="28" x="944" y="960" name="EXIDO" orien="R180" />
        <branch name="EXIDO">
            <wire x2="1040" y1="960" y2="960" x1="944" />
        </branch>
        <branch name="EXICLK">
            <wire x2="1040" y1="896" y2="896" x1="944" />
        </branch>
        <branch name="RS232_DCE_RXD">
            <wire x2="3136" y1="1152" y2="1152" x1="3120" />
        </branch>
        <branch name="RS232_DCE_TXD">
            <wire x2="3136" y1="1216" y2="1216" x1="3120" />
        </branch>
        <iomarker fontsize="28" x="944" y="896" name="EXICLK" orien="R180" />
        <branch name="XLXN_91">
            <wire x2="1472" y1="1152" y2="1152" x1="1424" />
            <wire x2="1472" y1="1152" y2="1984" x1="1472" />
            <wire x2="1744" y1="1984" y2="1984" x1="1472" />
        </branch>
        <branch name="EXICLK">
            <wire x2="1808" y1="832" y2="832" x1="1696" />
        </branch>
        <instance x="1808" y="560" name="RXFIFO" orien="R0">
        </instance>
        <branch name="XLXN_63(7:0)">
            <wire x2="1792" y1="544" y2="640" x1="1792" />
            <wire x2="1808" y1="640" y2="640" x1="1792" />
            <wire x2="3184" y1="544" y2="544" x1="1792" />
            <wire x2="3184" y1="544" y2="1088" x1="3184" />
            <wire x2="3184" y1="1088" y2="1088" x1="3120" />
        </branch>
        <branch name="foo">
            <wire x2="1440" y1="1216" y2="1216" x1="1424" />
            <wire x2="1440" y1="800" y2="1216" x1="1440" />
            <wire x2="1712" y1="800" y2="800" x1="1440" />
            <wire x2="1808" y1="800" y2="800" x1="1712" />
            <wire x2="1712" y1="768" y2="768" x1="1680" />
            <wire x2="1712" y1="768" y2="800" x1="1712" />
        </branch>
        <instance x="2096" y="464" name="XLXI_18" orien="R180" />
        <branch name="XLXN_161">
            <wire x2="800" y1="496" y2="1216" x1="800" />
            <wire x2="1040" y1="1216" y2="1216" x1="800" />
            <wire x2="1872" y1="496" y2="496" x1="800" />
        </branch>
        <instance x="1744" y="1840" name="TXFIFO" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3136" y="1152" name="RS232_DCE_RXD" orien="R0" />
        <iomarker fontsize="28" x="3136" y="1216" name="RS232_DCE_TXD" orien="R0" />
        <branch name="CLK_50MHZ">
            <wire x2="2704" y1="960" y2="960" x1="2688" />
        </branch>
        <instance x="2704" y="1248" name="XLXI_14" orien="R0">
        </instance>
        <branch name="XLXN_141(7:0)">
            <wire x2="2672" y1="1920" y2="1920" x1="2320" />
            <wire x2="2704" y1="1024" y2="1024" x1="2672" />
            <wire x2="2672" y1="1024" y2="1920" x1="2672" />
        </branch>
        <branch name="foo2">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1728" y="1376" type="branch" />
            <wire x2="1760" y1="1376" y2="1376" x1="1728" />
            <wire x2="3488" y1="1376" y2="1376" x1="1760" />
            <wire x2="1760" y1="704" y2="1376" x1="1760" />
            <wire x2="1808" y1="704" y2="704" x1="1760" />
            <wire x2="3488" y1="1024" y2="1024" x1="3120" />
            <wire x2="3488" y1="1024" y2="1376" x1="3488" />
        </branch>
        <branch name="PENISNET">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1648" y="2080" type="branch" />
            <wire x2="1696" y1="2080" y2="2080" x1="1648" />
            <wire x2="1744" y1="2080" y2="2080" x1="1696" />
            <wire x2="1696" y1="1808" y2="2080" x1="1696" />
            <wire x2="3472" y1="1808" y2="1808" x1="1696" />
            <wire x2="3472" y1="960" y2="960" x1="3120" />
            <wire x2="3472" y1="960" y2="1808" x1="3472" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="1744" y1="2112" y2="2112" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1552" y="2112" name="CLK_50MHZ" orien="R180" />
        <branch name="EXICLK">
            <wire x2="1744" y1="2016" y2="2016" x1="1504" />
        </branch>
        <iomarker fontsize="28" x="1504" y="2016" name="EXICLK" orien="R180" />
        <instance x="2112" y="1600" name="XLXI_19" orien="R180" />
        <branch name="XLXN_163">
            <wire x2="1040" y1="1152" y2="1152" x1="1024" />
            <wire x2="1024" y1="1152" y2="1696" x1="1024" />
            <wire x2="1856" y1="1696" y2="1696" x1="1024" />
        </branch>
        <branch name="BLAH">
            <wire x2="2368" y1="1664" y2="1664" x1="2112" />
            <wire x2="2368" y1="1664" y2="2048" x1="2368" />
            <wire x2="2464" y1="2048" y2="2048" x1="2368" />
            <wire x2="2368" y1="2048" y2="2048" x1="2320" />
        </branch>
        <branch name="BLAH2">
            <wire x2="2416" y1="1728" y2="1728" x1="2112" />
            <wire x2="2416" y1="1728" y2="2080" x1="2416" />
            <wire x2="2464" y1="2080" y2="2080" x1="2416" />
            <wire x2="2416" y1="2080" y2="2080" x1="2320" />
        </branch>
        <branch name="XLXN_82(7:0)">
            <wire x2="752" y1="576" y2="1280" x1="752" />
            <wire x2="1040" y1="1280" y2="1280" x1="752" />
            <wire x2="2448" y1="576" y2="576" x1="752" />
            <wire x2="2448" y1="576" y2="640" x1="2448" />
            <wire x2="2448" y1="640" y2="640" x1="2384" />
        </branch>
        <iomarker fontsize="28" x="2688" y="960" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="1696" y="832" name="EXICLK" orien="R180" />
        <iomarker fontsize="28" x="1696" y="720" name="CLK_50MHZ" orien="R180" />
        <branch name="CLK_50MHZ">
            <wire x2="1696" y1="720" y2="736" x1="1696" />
            <wire x2="1808" y1="736" y2="736" x1="1696" />
        </branch>
        <branch name="XLXN_185(7:0)">
            <wire x2="1536" y1="1344" y2="1344" x1="1424" />
            <wire x2="1536" y1="1344" y2="1920" x1="1536" />
            <wire x2="1744" y1="1920" y2="1920" x1="1536" />
        </branch>
        <branch name="XLXN_190">
            <wire x2="2704" y1="1088" y2="1088" x1="2688" />
            <wire x2="2688" y1="1088" y2="1328" x1="2688" />
            <wire x2="3088" y1="1328" y2="1328" x1="2688" />
            <wire x2="3088" y1="1328" y2="2336" x1="3088" />
            <wire x2="3088" y1="2336" y2="2336" x1="3024" />
        </branch>
        <instance x="2768" y="2432" name="XLXI_21" orien="R0" />
        <instance x="2512" y="880" name="XLXI_22" orien="R0" />
        <branch name="XLXN_192">
            <wire x2="2448" y1="768" y2="768" x1="2384" />
            <wire x2="2448" y1="752" y2="768" x1="2448" />
            <wire x2="2512" y1="752" y2="752" x1="2448" />
        </branch>
        <branch name="XLXN_193">
            <wire x2="2448" y1="800" y2="800" x1="2384" />
            <wire x2="2448" y1="800" y2="816" x1="2448" />
            <wire x2="2512" y1="816" y2="816" x1="2448" />
        </branch>
        <iomarker fontsize="28" x="2672" y="2160" name="RS232_DCE_RTS" orien="R180" />
        <branch name="XLXN_186">
            <wire x2="2464" y1="496" y2="496" x1="2096" />
            <wire x2="2464" y1="496" y2="1088" x1="2464" />
            <wire x2="2464" y1="1088" y2="1088" x1="2384" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="1040" y1="1472" y2="1472" x1="1008" />
        </branch>
        <iomarker fontsize="28" x="1008" y="1472" name="CLK_50MHZ" orien="R180" />
        <branch name="RS232_DCE_RTS">
            <wire x2="2688" y1="2208" y2="2208" x1="2432" />
            <wire x2="2432" y1="2208" y2="2288" x1="2432" />
            <wire x2="2512" y1="2288" y2="2288" x1="2432" />
            <wire x2="2688" y1="2160" y2="2160" x1="2672" />
            <wire x2="2688" y1="2160" y2="2208" x1="2688" />
        </branch>
        <instance x="2512" y="2320" name="XLXI_23" orien="R0" />
        <branch name="XLXN_213">
            <wire x2="2752" y1="2288" y2="2288" x1="2736" />
            <wire x2="2752" y1="2288" y2="2304" x1="2752" />
            <wire x2="2768" y1="2304" y2="2304" x1="2752" />
        </branch>
        <branch name="XLXN_214">
            <wire x2="2768" y1="2368" y2="2368" x1="2320" />
        </branch>
        <branch name="DEBUG(7:0)">
            <wire x2="1456" y1="1408" y2="1408" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1456" y="1408" name="DEBUG(7:0)" orien="R0" />
        <branch name="RS232_DCE_CTS">
            <wire x2="2784" y1="784" y2="784" x1="2768" />
            <wire x2="2880" y1="784" y2="784" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2880" y="784" name="RS232_DCE_CTS" orien="R0" />
    </sheet>
</drawing>
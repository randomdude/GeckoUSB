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
        <signal name="DEBUG(7:0)">
        </signal>
        <signal name="CLK_50MHZ" />
        <signal name="XLXN_63(7:0)" />
        <signal name="XLXN_65" />
        <signal name="XLXN_82(7:0)" />
        <signal name="XLXN_83" />
        <signal name="RS232_DCE_RXD" />
        <signal name="XLXN_91" />
        <signal name="RS232_DCE_TXD" />
        <signal name="XLXN_103" />
        <signal name="EXIDI" />
        <signal name="XLXN_135" />
        <signal name="XLXN_136" />
        <signal name="XLXN_137" />
        <signal name="XLXN_141(7:0)" />
        <signal name="XLXN_145" />
        <signal name="XLXN_148" />
        <signal name="XLXN_158" />
        <signal name="XLXN_160" />
        <signal name="XLXN_161" />
        <signal name="XLXN_162" />
        <signal name="XLXN_163" />
        <signal name="XLXN_165" />
        <signal name="XLXN_166" />
        <signal name="XLXN_168" />
        <signal name="XLXN_172" />
        <signal name="debug2(7:0)" />
        <port polarity="Input" name="EXIDO" />
        <port polarity="Input" name="EXICS" />
        <port polarity="Input" name="EXICLK" />
        <port polarity="Input" name="CLK_50MHZ" />
        <port polarity="Input" name="RS232_DCE_RXD" />
        <port polarity="Output" name="RS232_DCE_TXD" />
        <port polarity="Output" name="EXIDI" />
        <port polarity="Output" name="debug2(7:0)" />
        <blockdef name="usbexi">
            <timestamp>2012-5-17T20:55:18</timestamp>
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
            <rect width="256" x="64" y="-448" height="632" />
        </blockdef>
        <blockdef name="fifo">
            <timestamp>2012-5-17T20:2:4</timestamp>
            <rect width="256" x="32" y="56" height="224" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="112" y2="112" x1="0" />
            <line x2="32" y1="144" y2="144" x1="0" />
            <line x2="272" y1="168" y2="168" style="linestyle:Dash" x1="48" />
            <line x2="32" y1="192" y2="192" x1="0" />
            <line x2="32" y1="224" y2="224" x1="0" />
            <line x2="288" y1="80" y2="80" x1="320" />
            <line x2="288" y1="112" y2="112" x1="320" />
            <line x2="288" y1="192" y2="192" style="linewidth:W" x1="320" />
            <line x2="288" y1="224" y2="224" x1="320" />
            <line x2="288" y1="256" y2="256" x1="320" />
        </blockdef>
        <blockdef name="uart">
            <timestamp>2012-5-16T23:54:48</timestamp>
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="288" x="64" y="-320" height="312" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="416" y1="-224" y2="-224" x1="352" />
            <line x2="416" y1="-288" y2="-288" x1="352" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
            <rect width="64" x="352" y="-172" height="24" />
            <line x2="352" y1="-160" y2="-160" x1="416" />
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
        <block symbolname="usbexi" name="XLXI_6">
            <blockpin signalname="XLXN_163" name="usb_txe" />
            <blockpin signalname="XLXN_161" name="usb_rxf" />
            <blockpin signalname="EXICS" name="exi_cs" />
            <blockpin signalname="EXICLK" name="exi_clk" />
            <blockpin signalname="EXIDO" name="exi_do" />
            <blockpin name="exi_int" />
            <blockpin signalname="XLXN_82(7:0)" name="usb_data_in(7:0)" />
            <blockpin name="led" />
            <blockpin signalname="XLXN_103" name="usb_rd" />
            <blockpin signalname="XLXN_91" name="usb_wr" />
            <blockpin signalname="EXIDI" name="exi_di" />
            <blockpin signalname="DEBUG(7:0)" name="usb_data_out(7:0)" />
            <blockpin signalname="debug2(7:0)" name="debug(7:0)" />
        </block>
        <block symbolname="fifo" name="TXFIFO">
            <blockpin signalname="DEBUG(7:0)" name="din(7:0)" />
            <blockpin signalname="XLXN_91" name="wr_en" />
            <blockpin signalname="EXICLK" name="wr_clk" />
            <blockpin signalname="XLXN_148" name="rd_en" />
            <blockpin signalname="CLK_50MHZ" name="rd_clk" />
            <blockpin signalname="XLXN_165" name="full" />
            <blockpin signalname="XLXN_166" name="almost_full" />
            <blockpin signalname="XLXN_141(7:0)" name="dout(7:0)" />
            <blockpin name="empty" />
            <blockpin signalname="XLXN_83" name="valid" />
        </block>
        <block symbolname="uart" name="XLXI_14">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_141(7:0)" name="dataIn(7:0)" />
            <blockpin signalname="XLXN_83" name="dataInValid" />
            <blockpin signalname="XLXN_65" name="wr_req" />
            <blockpin signalname="XLXN_148" name="rd_req" />
            <blockpin signalname="RS232_DCE_RXD" name="uart_rx" />
            <blockpin signalname="RS232_DCE_TXD" name="uart_tx" />
            <blockpin signalname="XLXN_63(7:0)" name="dataout(7:0)" />
        </block>
        <block symbolname="fifo" name="RXFIFO">
            <blockpin signalname="XLXN_63(7:0)" name="din(7:0)" />
            <blockpin signalname="XLXN_65" name="wr_en" />
            <blockpin signalname="CLK_50MHZ" name="wr_clk" />
            <blockpin signalname="XLXN_103" name="rd_en" />
            <blockpin signalname="EXICLK" name="rd_clk" />
            <blockpin name="full" />
            <blockpin name="almost_full" />
            <blockpin signalname="XLXN_82(7:0)" name="dout(7:0)" />
            <blockpin name="empty" />
            <blockpin signalname="XLXN_136" name="valid" />
        </block>
        <block symbolname="inv" name="XLXI_18">
            <blockpin signalname="XLXN_136" name="I" />
            <blockpin signalname="XLXN_161" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_19">
            <blockpin signalname="XLXN_166" name="I0" />
            <blockpin signalname="XLXN_165" name="I1" />
            <blockpin signalname="XLXN_163" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1040" y="1248" name="XLXI_6" orien="R0">
        </instance>
        <branch name="CLK_50MHZ">
            <wire x2="2224" y1="960" y2="960" x1="2128" />
        </branch>
        <branch name="EXIDI">
            <wire x2="1440" y1="832" y2="832" x1="1424" />
            <wire x2="1456" y1="832" y2="832" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1456" y="832" name="EXIDI" orien="R0" />
        <iomarker fontsize="28" x="944" y="832" name="EXICS" orien="R180" />
        <branch name="EXICS">
            <wire x2="960" y1="832" y2="832" x1="944" />
            <wire x2="1040" y1="832" y2="832" x1="960" />
        </branch>
        <iomarker fontsize="28" x="944" y="960" name="EXIDO" orien="R180" />
        <branch name="EXIDO">
            <wire x2="960" y1="960" y2="960" x1="944" />
            <wire x2="1040" y1="960" y2="960" x1="960" />
        </branch>
        <branch name="EXICLK">
            <wire x2="960" y1="896" y2="896" x1="944" />
            <wire x2="1040" y1="896" y2="896" x1="960" />
        </branch>
        <branch name="RS232_DCE_RXD">
            <wire x2="2720" y1="1152" y2="1152" x1="2640" />
        </branch>
        <branch name="EXICLK">
            <wire x2="1808" y1="1216" y2="1216" x1="1744" />
        </branch>
        <branch name="RS232_DCE_TXD">
            <wire x2="2720" y1="1216" y2="1216" x1="2640" />
        </branch>
        <instance x="1808" y="1072" name="TXFIFO" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2128" y="960" name="CLK_50MHZ" orien="R180" />
        <instance x="2224" y="1248" name="XLXI_14" orien="R0">
        </instance>
        <branch name="XLXN_83">
            <wire x2="2208" y1="1328" y2="1328" x1="2128" />
            <wire x2="2224" y1="1088" y2="1088" x1="2208" />
            <wire x2="2208" y1="1088" y2="1328" x1="2208" />
        </branch>
        <iomarker fontsize="28" x="944" y="896" name="EXICLK" orien="R180" />
        <branch name="XLXN_141(7:0)">
            <wire x2="2192" y1="1264" y2="1264" x1="2128" />
            <wire x2="2224" y1="1024" y2="1024" x1="2192" />
            <wire x2="2192" y1="1024" y2="1264" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="1744" y="1216" name="EXICLK" orien="R180" />
        <branch name="XLXN_91">
            <wire x2="1472" y1="1152" y2="1152" x1="1424" />
            <wire x2="1472" y1="1152" y2="1184" x1="1472" />
            <wire x2="1792" y1="1184" y2="1184" x1="1472" />
            <wire x2="1808" y1="1184" y2="1184" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="1744" y="1296" name="CLK_50MHZ" orien="R180" />
        <branch name="CLK_50MHZ">
            <wire x2="1808" y1="1296" y2="1296" x1="1744" />
        </branch>
        <branch name="XLXN_148">
            <wire x2="1808" y1="1264" y2="1264" x1="1792" />
            <wire x2="1792" y1="1264" y2="1536" x1="1792" />
            <wire x2="3008" y1="1536" y2="1536" x1="1792" />
            <wire x2="3008" y1="960" y2="960" x1="2640" />
            <wire x2="3008" y1="960" y2="1536" x1="3008" />
        </branch>
        <branch name="CLK_50MHZ">
            <wire x2="1808" y1="704" y2="704" x1="1696" />
        </branch>
        <branch name="EXICLK">
            <wire x2="1808" y1="784" y2="784" x1="1696" />
        </branch>
        <branch name="XLXN_136">
            <wire x2="2224" y1="496" y2="496" x1="2096" />
            <wire x2="2224" y1="496" y2="816" x1="2224" />
            <wire x2="2224" y1="816" y2="816" x1="2128" />
        </branch>
        <instance x="1808" y="560" name="RXFIFO" orien="R0">
        </instance>
        <branch name="XLXN_63(7:0)">
            <wire x2="1744" y1="544" y2="640" x1="1744" />
            <wire x2="1808" y1="640" y2="640" x1="1744" />
            <wire x2="2688" y1="544" y2="544" x1="1744" />
            <wire x2="2688" y1="544" y2="1088" x1="2688" />
            <wire x2="2688" y1="1088" y2="1088" x1="2640" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2656" y1="432" y2="432" x1="1728" />
            <wire x2="2656" y1="432" y2="1024" x1="2656" />
            <wire x2="1728" y1="432" y2="672" x1="1728" />
            <wire x2="1808" y1="672" y2="672" x1="1728" />
            <wire x2="2656" y1="1024" y2="1024" x1="2640" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="1440" y1="1216" y2="1216" x1="1424" />
            <wire x2="1440" y1="752" y2="1216" x1="1440" />
            <wire x2="1792" y1="752" y2="752" x1="1440" />
            <wire x2="1808" y1="752" y2="752" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="1696" y="704" name="CLK_50MHZ" orien="R180" />
        <iomarker fontsize="28" x="1696" y="784" name="EXICLK" orien="R180" />
        <branch name="XLXN_82(7:0)">
            <wire x2="752" y1="576" y2="1280" x1="752" />
            <wire x2="1040" y1="1280" y2="1280" x1="752" />
            <wire x2="2192" y1="576" y2="576" x1="752" />
            <wire x2="2192" y1="576" y2="752" x1="2192" />
            <wire x2="2144" y1="752" y2="752" x1="2128" />
            <wire x2="2192" y1="752" y2="752" x1="2144" />
        </branch>
        <instance x="2096" y="464" name="XLXI_18" orien="R180" />
        <branch name="XLXN_161">
            <wire x2="800" y1="496" y2="1216" x1="800" />
            <wire x2="1040" y1="1216" y2="1216" x1="800" />
            <wire x2="1856" y1="496" y2="496" x1="800" />
            <wire x2="1872" y1="496" y2="496" x1="1856" />
        </branch>
        <iomarker fontsize="28" x="2720" y="1152" name="RS232_DCE_RXD" orien="R0" />
        <iomarker fontsize="28" x="2720" y="1216" name="RS232_DCE_TXD" orien="R0" />
        <branch name="XLXN_165">
            <wire x2="2160" y1="1472" y2="1472" x1="2080" />
            <wire x2="2160" y1="1152" y2="1152" x1="2128" />
            <wire x2="2160" y1="1152" y2="1472" x1="2160" />
        </branch>
        <branch name="XLXN_166">
            <wire x2="2144" y1="1408" y2="1408" x1="2080" />
            <wire x2="2144" y1="1184" y2="1184" x1="2128" />
            <wire x2="2144" y1="1184" y2="1408" x1="2144" />
        </branch>
        <instance x="2080" y="1344" name="XLXI_19" orien="R180" />
        <branch name="XLXN_163">
            <wire x2="1040" y1="1152" y2="1152" x1="1024" />
            <wire x2="1024" y1="1152" y2="1440" x1="1024" />
            <wire x2="1808" y1="1440" y2="1440" x1="1024" />
            <wire x2="1824" y1="1440" y2="1440" x1="1808" />
        </branch>
        <branch name="DEBUG(7:0)">
            <wire x2="1488" y1="1344" y2="1344" x1="1424" />
            <wire x2="1488" y1="1152" y2="1344" x1="1488" />
            <wire x2="1792" y1="1152" y2="1152" x1="1488" />
            <wire x2="1808" y1="1152" y2="1152" x1="1792" />
        </branch>
        <branch name="debug2(7:0)">
            <wire x2="1440" y1="1408" y2="1408" x1="1424" />
            <wire x2="1536" y1="1408" y2="1408" x1="1440" />
            <wire x2="1552" y1="1408" y2="1408" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1552" y="1408" name="debug2(7:0)" orien="R0" />
    </sheet>
</drawing>
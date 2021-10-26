function [] = plotAllPlots()
    %PLOTALLPLOTS Automatically detect app types present in output files
    %and create selected plots for each of them.
    % Please note that this method uses the exportgraphics function which
    % was introduced in MATLAB version R2021b. Ensure that you are running
    % version R2021b (or newer) before executing this function.
    % Because there are going to be so many, the appendPlot function closes
    % each plot after appending it to the PDF file. If you want to keep
    % them open to manipulate them before saving, maybe put a breakpoint at
    % the beginning of that function.
    %   To skip a plot, put a % at the beginning of the line.
    config = configuration.autoConfig();
    % Plot in color, or comment out the next line.
    config.ColorPlot = 1;
    figName = strcat(config.FolderPath, '\', datestr(now,'yyyy-mm-dd_HH.MM.SS.FFF'), '.pdf');
    for i=1:length(config.AppTypes)
        appType = config.AppTypes(i);
        appendPlot(plotGenericResult(1, 2, 'Failed Tasks (%)', appType, 1, config), figName);
		appendPlot(plotGenericResult(1, 5, 'Service Time (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(1, 6, 'Processing Time (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(1, 7, 'Average Network Delay (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(1, 8, 'Average VM Utilization (%)', appType, 1, config), figName);
		appendPlot(plotGenericResult(1, 9, 'Average Cost ($)', appType, 0, config), figName);
		appendPlot(plotGenericResult(1, 12, 'Avg. host util. (%)', appType, 1, config, '', 'linear'), figName);
		appendPlot(plotGenericResult(1, 13, 'Avg. network util. (%)', appType, 1, config, '', 'linear'), figName);
		appendPlot(plotGenericResult(2, 5, 'Service Time on Fog (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(2, 6, 'Processing Time on Cloudlet (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(2, 7, 'Average WLAN Delay (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(3, 5, 'Service Time on Cloud (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(3, 6, 'Processing Time on Cloud (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(3, 7, 'Average WAN Delay (sec)', appType, 0, config), figName);
		appendPlot(plotGenericResult(4, 1, 'Average Distance (m)', appType, 0, config), figName);
		appendPlot(plotGenericResult(4, 2, 'Average Hops', appType, 0, config), figName);
		appendPlot(plotGenericResult(4, 3, 'Avg. no. of hosts searched', appType, 0, config, '', 'log'), figName);
		appendPlot(plotGenericResult(4, 4, 'Avg. no. of messages', appType, 0, config, '', 'log'), figName);
		appendPlot(plotGenericResult(10,1, 'Total Energy', appType, 0, config, '', 'linear'), figName);
		appendPlot(plotGenericResult(10,2, 'Dynamic Network Energy', appType, 0, config, '', 'linear'), figName);
		appendPlot(plotGenericResult(10,3, 'Dynamic Fog Node Energy', appType, 0, config, '', 'linear'), figName);
    end
end

function [] = appendPlot(figurePlot, figureName)
    if isfile(figureName)
        exportgraphics(figurePlot, figureName, 'Append', true);
    else
        exportgraphics(figurePlot, figureName, 'ContentType', 'vector');
    end
    close(figurePlot);
end
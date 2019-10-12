function onClickedPieChart(value) {
    resetPieChart();
    chartStartAngle.to = pieSeries.startAngle + 90;
    chartEndAngle.to = pieSeries.endAngle + 90;
    specPiece1.target = value;
    specPiece2.target = value;
    rotate.start();
}
function resetPieChart(){
    for (var i = 0 ; i < pieSeries.count; i ++){
        pieSeries.at(i).exploded = false;
    }
    return;
}

//script of dashboardadmin.jsp

$(document).ready(function () {
    initializingTheUsersPie();

    function initializingTheUsersPie() {
        var pie_users = echarts.init(document.getElementById('users_pie'));
        var agencyNames = ["Agency one", "Agency two", "Agency three", "Agency four"];
        var agencyAndUsers = [
            {value: 5, name: 'Agency one'},
            {value: 2, name: 'Agency two'},
            {value: 8, name: 'Agency three'},
            {value: 1, name: 'Agency four'}
        ];


        pie_users.setOption({
            // Colors
            color: [
                '#2ec7c9', '#b6a2de', '#5ab1ef', '#ffb980', '#d87a80',
                '#8d98b3', '#e5cf0d', '#97b552', '#95706d', '#dc69aa'
            ],

            // Global text styles
            textStyle: {
                fontFamily: 'Roboto, Arial, Verdana, sans-serif',
                fontSize: 13
            },

            // Add title
            title: {
                text: 'Uploaded videos',
                subtext: 'Agencies and Videos',
                left: 'center',
                textStyle: {
                    fontSize: 17,
                    fontWeight: 500
                },
                subtextStyle: {
                    fontSize: 12
                }
            },

            // Add tooltip
            tooltip: {
                trigger: 'item',
                backgroundColor: 'rgba(0,0,0,0.75)',
                padding: [10, 15],
                textStyle: {
                    fontSize: 13,
                    fontFamily: 'Roboto, sans-serif'
                },
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },

            // Add legend
            legend: {
                orient: 'vertical',
                top: 'center',
                left: 0,
                data: agencyNames,
                itemHeight: 8,
                itemWidth: 8
            },

            // Add series
            series: [{
                    name: 'Amount',
                    type: 'pie',
                    radius: '70%',
                    center: ['50%', '57.5%'],
                    itemStyle: {
                        normal: {
                            borderWidth: 1,
                            borderColor: '#fff'
                        }
                    },
                    data: agencyAndUsers
                }]
        });
    }

    function videoDonutsInitialization() {
        console.log("video donut init");

        var pie_multiples_element = document.getElementById('pie_multiples');

        var agencyNames = ["Agency one", "Agency two", "Agency three", "Agency four"];
        var agencyAndUsers = [
            {value: 5, name: 'Agency one'},
            {value: 2, name: 'Agency two'},
            {value: 8, name: 'Agency three'},
            {value: 1, name: 'Agency four'}
        ];

        // Initialize chart
        var pie_multiples = echarts.init(pie_multiples_element);


        // Top text label
        var labelTop = {
            show: true,
            position: 'center',
            formatter: '{b}\n',
            fontSize: 15,
            lineHeight: 50,
            rich: {
                a: {}
            }
        };

        // Background item style
        var backStyle = {
            color: '#eee',
            emphasis: {
                color: '#eee'
            }
        };

        // Bottom text label
        var labelBottom = {
            color: '#333',
            show: true,
            position: 'center',
            formatter: function (params) {
                return '\n\n' + (100 - params.value) + '%'
            },
            fontWeight: 500,
            lineHeight: 35,
            rich: {
                a: {}
            },
            emphasis: {
                color: '#333'
            }
        };

        // Set inner and outer radius
        var radius = [52, 65];

        // Options
        pie_multiples.setOption({

            // Colors
            color: [
                '#2ec7c9', '#b6a2de', '#5ab1ef', '#ffb980', '#d87a80',
                '#8d98b3', '#e5cf0d', '#97b552', '#95706d', '#dc69aa',
                '#07a2a4', '#9a7fd1', '#588dd5', '#f5994e', '#c05050',
                '#59678c', '#c9ab00', '#7eb00a', '#6f5553', '#c14089'
            ],

            // Global text styles
            textStyle: {
                fontFamily: 'Roboto, Arial, Verdana, sans-serif',
                fontSize: 13
            },

            // Add title
            title: {
                text: 'The Application World',
                subtext: 'from global web index',
                left: 'center',
                textStyle: {
                    fontSize: 17,
                    fontWeight: 500
                },
                subtextStyle: {
                    fontSize: 12
                }
            },

            // Add legend
            legend: {
                bottom: 0,
                left: 'center',
                data: ['GMaps', 'Facebook', 'Youtube', 'Google+', 'Weixin', 'Twitter', 'Skype', 'Messenger', 'Whatsapp', 'Instagram'],
                itemHeight: 8,
                itemWidth: 8,
                selectedMode: false
            },

            // Add series
            series: [
                {
                    type: 'pie',
                    center: ['10%', '33%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 46, label: labelBottom, itemStyle: backStyle},
                        {name: 'GMaps', value: 54, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['30%', '33%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 56, label: labelBottom, itemStyle: backStyle},
                        {name: 'Facebook', value: 44, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['50%', '33%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 65, label: labelBottom, itemStyle: backStyle},
                        {name: 'Youtube', value: 35, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['70%', '33%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 70, label: labelBottom, itemStyle: backStyle},
                        {name: 'Google+', value: 30, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['90%', '33%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 73, label: labelBottom, itemStyle: backStyle},
                        {name: 'Weixin', value: 27, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['10%', '73%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 78, label: labelBottom, itemStyle: backStyle},
                        {name: 'Twitter', value: 22, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['30%', '73%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 78, label: labelBottom, itemStyle: backStyle},
                        {name: 'Skype', value: 22, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['50%', '73%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 78, label: labelBottom, itemStyle: backStyle},
                        {name: 'Messenger', value: 22, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['70%', '73%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 83, label: labelBottom, itemStyle: backStyle},
                        {name: 'Whatsapp', value: 17, label: labelTop}
                    ]
                },
                {
                    type: 'pie',
                    center: ['90%', '73%'],
                    radius: radius,
                    hoverAnimation: false,
                    data: [
                        {name: 'other', value: 89, label: labelBottom, itemStyle: backStyle},
                        {name: 'Instagram', value: 11, label: labelTop}
                    ]
                }
            ]
        });

    }
});

//onclick events for stats card
// document.getElementById("agenciesCountStatsCard").onclick = function(){
//     window.location.href = "agency.jsp";//redirect to agency page
// };

// document.getElementById("agencyUsersCountStatsCard").onclick = function (){
//     window.location.href = "agencyuser.jsp";//redirect to agency user page
// };

//onclick events for stats card


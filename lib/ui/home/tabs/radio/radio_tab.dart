import 'package:flutter/material.dart';
import 'package:islami_project/utils/app_colors.dart';
import 'package:islami_project/utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> radioNames = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
  ];

  final List<String> reciterNames = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
    "Malik shaibat Alhamed",
  ];

  int? playingIndex;
  Set<int> mutedIndexes = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.blackColor,
              unselectedLabelColor: AppColors.whiteColor,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Center(
                    child: Text(
                      "Radio",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _tabController.index == 0
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      "Reciters",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _tabController.index == 1
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [buildList(radioNames), buildList(reciterNames)],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(List<String> names) {
    return ListView.separated(
      padding: EdgeInsets.all(23),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemCount: names.length,
      itemBuilder: (context, index) {
        final bool isPlaying = playingIndex == index;
        final bool isMuted = mutedIndexes.contains(index);
        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 140),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: isPlaying ? -32 : 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  isPlaying
                      ? 'assets/images/sound_wave.png'
                      : 'assets/images/radio_mosque.png',
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      names[index],
                      style: AppStyles.bold20black,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isPlaying) {
                                playingIndex = null;
                              } else {
                                playingIndex = index;
                              }
                            });
                          },
                          child: Icon(
                            isPlaying
                                ? Icons.pause_circle
                                : Icons.play_circle_fill,
                            color: AppColors.blackColor,
                            size: 36,
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isMuted) {
                                mutedIndexes.remove(index);
                              } else {
                                mutedIndexes.add(index);
                              }
                            });
                          },
                          child: Icon(
                            isMuted ? Icons.volume_off : Icons.volume_up,
                            color: AppColors.blackColor,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

part of '../news_details.dart';

class NewsDetailBody extends StatelessWidget {
  final NewsDetailScreenState state;

  const NewsDetailBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).background.main,
      appBar: AppBar(
       // leading: IconButton(
          // icon: Icon(
          //   Icons.more_horiz, 
          //   color: AppTheme.of(context).text.shade800!,
          // ),
          //onPressed: () => Navigator.pop(context),
      //  ),
        title: Text(
          'Article Details',
          style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: Space.hf(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(16),
                        NewsDetailView(
          title: 'How AI is transforming the future of remote work worldwide',
          paragraphs: mockParagraphs,
          imagePath: 'assets/pngs/Frame 2147229685.png',
          badgeText: 'Top',
        ),
            Space.yf(24),

     
            // ─── 4. Sub-Heading Separator Section ───
            Text(
              'More Articles',
              style: AppText.b1b!.cl(AppTheme.of(context).text.shade800!),
            ),
            Space.yf(16),

            // ─── 5. Horizontal Recommender Row (Using shared card module) ───
            SizedBox(
              height: 293.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.recommendations.length,
                separatorBuilder: (context, index) => Space.xf(8),
                itemBuilder: (context, index) {
                  final item = state.recommendations[index];
                  
                  // Wrap with a fixed width constraint so it functions correctly inside horizontal scrolling views
                  return SizedBox(
                    width: 280.w,
                    child: NewsTextArticleCard(
                      title: item.title,
                      content: item.content,
                      badgeText: item.badgeText,
                      hashtags: item.hashtags,
                      onTap: () => state.navigateToArticle(item),
                    ),
                  );
                },
              ),
            ),
            Space.yf(24),
          ],
        ),
      ),
    );
  }
}

// class NewsDetailView extends StatelessWidget {
//   final String title;
//   final List<String> paragraphs;
//   final String imagePath;
//   final String badgeText;

//   const NewsDetailView({
//     super.key,
//     required this.title,
//     required this.paragraphs,
//     required this.imagePath,
//     this.badgeText = 'Top',
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ─── Top Display Area: Hero Picture Banner ───
//         Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16.r),
              
//               child: Image.asset(
//                 imagePath,
//                 width: double.infinity,
//                 height: 177.h,
//                 fit: BoxFit.cover,
//               ),
//             ),
            
//             // Overlay Badge Positioned Frame (Safe clearance below the app bar)
//             Positioned(
//               top: 12.h,
//               left: 8.w, // Shifts label right to clear the back arrow action zone
//               child: Container(
//               padding: Space.all(12,6),
//                 decoration: BoxDecoration(
//                   color: AppTheme.of(context).background.main!,
//                   borderRadius: BorderRadius.circular(6.r),
//                 ),
//                 child: Text(
//                   badgeText,
//                   style: AppText.l1bm!.cl(AppTheme.of(context).text.shade800!),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Space.yf(10),

//         // ─── Article Details Body Content ───
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Main Article Header Heading Text
//             Text(
//               title,
//               style: AppText.h5b!.cl(AppTheme.of(context).text.shade800!),
                   
                  
//             ),
        
//             Space.yf(10),
        
//             // Renders your customizable paragraph body items sequentially
//             ListView.builder(
//               shrinkWrap: true,
//               padding: EdgeInsets.zero,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: paragraphs.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: Space.only(bottom: 10),
//                   child: Text(
//                     paragraphs[index],
//                     style: AppText.l1!.cl(AppTheme.of(context).text.shade600!),
                      
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

//   final mockParagraphs = [
//       'Explore the dynamic realm of artificial intelligence revolutionizing online teamwork. From intelligent virtual helpers to advanced data insights, uncover innovations that are transforming efficiency and creativity in our digital world.',
//       'Uncover the transformative power of artificial intelligence in enhancing remote collaboration. With tools ranging from AI-driven assistants to insightful analytics, learn how these advancements are redefining productivity and creative processes in the modern era.',
//       'Delve into the innovative world of artificial intelligence that is reshaping virtual teamwork. Discover how smart tools and predictive technologies are enhancing both productivity and creativity in today\'s digital landscape.',
//       'Investigate the cutting-edge advancements in artificial intelligence that are improving virtual collaboration. From AI assistants to data-driven insights, find out how these technologies are elevating productivity and sparking creativity in the digital age.',
//       'Journey through the advancements in artificial intelligence that are enhancing online collaboration. From intelligent assistants to predictive analytics, discover the tools that are transforming productivity and creativity in our increasingly digital environment.',
//     ];
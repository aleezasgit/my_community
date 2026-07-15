part of '../faq.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final state = context.watch<_ScreenState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'FAQs',type: AppBarType.withTextCenter),
    //  extendBodyBehindAppBar: true,
    
      body: SingleChildScrollView(
        padding: Space.all(16),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Space.yf(16),
              
            // ─── FAQ Cards ───────────────────────────────────────
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _faqs.length,
              separatorBuilder: (_, __) => Space.yf(10),
              itemBuilder: (context, index) {
                return _FaqCard(
                  question: _faqs[index]['question']!,
                  answer: _faqs[index]['answer']!,
                  isExpanded: state.expandedIndices.contains(index),
                  onTap: () => state.onTileToggled(index),
                );
              },
            ),
              
            Space.yf(32),
          ],
        ),
      ),
    );
  }
}


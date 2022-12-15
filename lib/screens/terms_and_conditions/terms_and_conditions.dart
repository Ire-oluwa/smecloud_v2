import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sme_cloud_version2/constants/app_constants.dart';
import 'package:sme_cloud_version2/widgets/custom_text/custom_text.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  static const String id = "terms and conditions";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
            size: 20.sp,
          ),
        ),
        title: CustomText(
          size: 20.sp,
          colour: kBlack,
          text: "Terms and Conditions",
          weight: kSemiBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: 1000.h,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "\t\tWelcome to SMECLOUD, the website and mobile service of CDLP HUB Limited (“SMECLOUD,” “we,” or “us”). This page explains the terms by which you may use our online and/or mobile services, website, and software provided on or in connection with the service (collectively the “Service”). By accessing or using the Service, you signify that you have read, understood, and agree to be bound by this Terms of Service Agreement (“Agreement”) and to the collection and use of your information as set forth in the SMECLOUD Privacy Policy , whether or not you are a registered user of our Service. This Agreement applies to all visitors, users, and others who access the Service (“Users”).\n\nThis includes: the services that may be offered in the site; the information provided in the sites; and the ability to register into our database, receive newsletters and promotional emails;\nSMECLOUD reserves the right to review and update these Terms and Conditions at any time, effective immediately upon posting on our Sites. A violation of these Terms and Conditions, shall lead to a termination of the users access to the site and/or appropriate legal action against the user by SMECLOUD.",
                        weight: kNormal,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                CustomText(
                  size: 14.sp,
                  colour: kBlack,
                  text: "Copyright and Trademark  Notice",
                  weight: kBold,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  child: CustomText(
                    size: 12.sp,
                    colour: kBlack,
                    text:
                        "The contents of all material available on our Sites are copyrighted by SMECLOUD unless otherwise indicated. All rights are reserved and content may not be reproduced, downloaded, disseminated, or transferred, in any form or by any means, except with the prior written consent of SMECLOUD or as indicated below:",
                    weight: kNormal,
                  ),
                ),
                SizedBox(height: 3.h),
                CustomText(
                    size: 14.sp, colour: kBlack, text: "A. Permitted Use:"),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "The user may download pages or other content for personal use on a single computer, but no part of such content may be otherwise or subsequently reproduced, downloaded, disseminated, or transferred, in any form or by any means, except with the prior written consent of, and with express attribution to SMECLOUD.\nThe user agrees that he/she shall only be authorized to visit, view and to retain a copy of pages of the Sites for personal use, and that he/she shall not duplicate, download, publish, modify or otherwise distribute the material on the Sites for any purpose other than for personal use, unless otherwise specifically authorized by SMECLOUD to do so.\nThe user also agrees not to deep-link to the site for any purpose, unless specifically authorized by us to do so.",
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                CustomText(
                    size: 14.sp,
                    colour: kBlack,
                    text: "B. General Legal Notice and Liability Disclaimer:"),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "SMECLOUD shall make reasonable effort to present accurate and reliable information only on its Sites, however SMECLOUD does not endorse, approve or certify such information, nor does it guarantee the accuracy, completeness, efficacy, or timeliness of such information. Therefore, the use of such information is voluntary, and reliance on it should only be undertaken after an independent review by qualified experts.Reference herein to any specific commercial product, process or service does not constitute or imply endorsement, recommendation or favoring by SMECLOUD. At certain places on this site, live 'links ' to other Web sites can be accessed. Such external sites contain information created, published, maintained, or otherwise posted by institutions or organizations independent of SMECLOUD.SMECLOUD does not endorse, approve, certify, or control these external sites and does not guarantee the accuracy, completeness, efficacy, or timeliness of information located at such sites. The use of any information obtained from such sites is voluntary, and reliance on it should only be undertaken after an independent review by qualified experts.SMECLOUD assumes no responsibility for consequences resulting from use of the information contained in its Sites, or from use of the information obtained at linked sites, or in any respect for the content of such information. SMECLOUD is not responsible for, and expressly disclaims all liability for, damages of any kind arising out of use, reference to, reliance on, or performance of such information.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                CustomText(
                  size: 14.sp,
                  colour: kBlack,
                  text: "C. Activation Charge:",
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                          size: 12.sp,
                          colour: kBlack,
                          text:
                              "SMECLOUD may make a statutory deduction of 1,000 NGN only from the students' bank account that is domiciled with our financial partners. This deduction, when made, shall be a charge for the student's activation fee for the program and this fee is non-refundable."),
                    ],
                  ),
                ),
                SizedBox(height: 7.h),
                CustomText(
                  size: 14.sp,
                  colour: kBlack,
                  text: "D. Privacy Policy:",
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "SMECLOUD values individual privacy. Please visit our privacy policy page to learn more about what information we collect from our site visitors and how it is treated.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.h),
                CustomText(
                  size: 14.sp,
                  colour: kBlack,
                  text: "E. Severability:",
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "The invalidity or unenforceability of any particular provision of this Policy shall not affect the remaining provisions hereof, and this Policy shall be construed in all respects as if such invalid or unenforceable provision had been omitted.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.h),
                CustomText(
                  size: 14.sp,
                  colour: kBlack,
                  text: "F. No Waiver:",
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "No waiver of any term of this Agreement shall be deemed a further or continuing waiver of such term or any other term, and SMECLOUD’s failure to assert any right or provision under this Agreement shall not constitute a waiver of such right or provision.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.h),
                CustomText(
                  size: 14.sp,
                  colour: kBlack,
                  text: "G. Contact:",
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  child: Column(
                    children: [
                      CustomText(
                        size: 12.sp,
                        colour: kBlack,
                        text:
                            "For legal notices please mail or serve us at 6, Saymore, Opposite Ojoo Central Mosque, Ojoo, Ibadan.",
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget firstParagraph() {
  return Expanded(
    child: CustomText(
      size: 13.sp,
      colour: kBlack,
      text:
          "\t\tWelcome to SMECLOUD, the website and mobile service of CDLP HUB Limited (“SMECLOUD,” “we,” or “us”). This page explains the terms by which you may use our online and/or mobile services, website, and software provided on or in connection with the service (collectively the “Service”). By accessing or using the Service, you signify that you have read, understood, and agree to be bound by this Terms of Service Agreement (“Agreement”) and to the collection and use of your information as set forth in the SMECLOUD Privacy Policy , whether or not you are a registered user of our Service. This Agreement applies to all visitors, users, and others who access the Service (“Users”).",
      weight: kNormal,
      align: TextAlign.justify,
    ),
  );
}

Widget secondParagraph() {
  return Expanded(
    child: CustomText(
      size: 13.sp,
      colour: kBlack,
      text:
          "This includes: the services that may be offered in the site; the information provided in the sites; and the ability to register into our database, receive newsletters and promotional emails;",
      weight: kNormal,
      align: TextAlign.justify,
    ),
  );
}

Widget thirdParagraph() {
  return Expanded(
    child: CustomText(
      size: 13.sp,
      colour: kBlack,
      text:
          "SMECLOUD reserves the right to review and update these Terms and Conditions at any time, effective immediately upon posting on our Sites. A violation of these Terms and Conditions, shall lead to a termination of the users access to the site and/or appropriate legal action against the user by SMECLOUD.",
      weight: kNormal,
      align: TextAlign.justify,
    ),
  );
}

Widget content({text}) {
  return Expanded(
    child: CustomText(
      size: 13.sp,
      colour: kBlack,
      text: text,
      weight: kNormal,
      align: TextAlign.justify,
    ),
  );
}

import 'package:flutter/material.dart';

successMessage(BuildContext context) {
  bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
          padding: isTablet ? EdgeInsets.all(15) : EdgeInsets.all(8),
          height: 70,
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Successfully",
                    style: TextStyle(
                        fontFamily: "inter",
                        fontSize: isTablet ? 25 : 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "Welcome Back To Andromeda...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isTablet ? 22 : 14,
                      fontFamily: "inter",
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ))
            ],
          )),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white54,
      elevation: 3,
    ),
  );
}

errorMessage(BuildContext context) {
  bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;


  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Expanded(
        child: Container(
            padding: isTablet ? EdgeInsets.all(8) : EdgeInsets.all(8),
            height: isTablet ? 60 : 70,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Opps. An Error Occured",
                      style: TextStyle(
                          fontFamily: "inter",
                          fontSize: isTablet ? 25 : 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      " Check Your UserName Or Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isTablet ? 22 : 14,
                        fontFamily: "inter",
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ))
              ],
            )),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white54,
      elevation: 3,
    ),
  );
}

package io.jans.agama.securitykey;

import io.jans.as.common.model.common.User;
import io.jans.as.common.service.common.EncryptionService;
import io.jans.as.common.service.common.UserService;
import io.jans.orm.exception.operation.EntryNotFoundException;
import io.jans.service.cdi.util.CdiUtil;
import io.jans.util.StringHelper;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static io.jans.inbound.Attrs.*;

public class IdentityProcessor {

    private static final Logger logger = LoggerFactory.getLogger(IdentityProcessor.class);

    private static final String INUM_ATTR = "inum";

    public static Map<String, String> accountFromUid(String uid) {
        User user = getUser(UID, uid);
        boolean local = user != null;
        logger.debug("There is {} local account for {}", local ? "a" : "no", uid);

        if (local) {
            String inum = getSingleValuedAttr(user, INUM_ATTR);
            String name = getSingleValuedAttr(user, GIVEN_NAME);
            String email = getSingleValuedAttr(user, MAIL);

            if (name == null) {
                name = getSingleValuedAttr(user, DISPLAY_NAME);

                if (name == null) {
                    name = email.substring(0, email.indexOf("@"));
                }
            }
            return Map.of(UID, uid, INUM_ATTR, inum, "name", name, "email", email);
        }
        Map<String, String> result = Collections.emptyMap();
        return null;
    }

    private static User getUser(String attributeName, String value) {
        UserService userService = CdiUtil.bean(UserService.class);
        return userService.getUserByAttribute(attributeName, value, true);
    }

    private static String getSingleValuedAttr(User user, String attribute) {
        Object value = null;
        if (attribute.equals(UID)) {
            value = user.getUserId();
        } else {
            value = user.getAttribute(attribute, true, false);
        }
        return value == null ? null : value.toString();
    }
}

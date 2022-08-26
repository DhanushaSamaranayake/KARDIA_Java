package org.kardia.webapp.view;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class EmailBody {
    private String to;
    private String subject;
    private String body;
}
